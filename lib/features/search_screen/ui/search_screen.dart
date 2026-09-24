import 'dart:async';
import 'package:ecommerce/shared/network_data/get_product_data.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  static const String name = '/SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _queryController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _query = '';
  Timer? _debounceTimer;

  final List<String> _quickSearches = [
    'Apple',
    'Phone',
    'Shirt',
    'Shoe',
    'Watch',
    'Headphone',
  ];

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _queryController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _query = value.trim();
        });
      }
    });
  }

  void _executeSearch(String text) {
    _debounceTimer?.cancel();
    _queryController.text = text;
    _queryController.selection = TextSelection.fromPosition(
      TextPosition(offset: text.length),
    );
    setState(() {
      _query = text.trim();
    });
    _focusNode.unfocus();
  }

  void _clearSearch() {
    _queryController.clear();
    setState(() {
      _query = '';
    });
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final products = getIt<GetProductData>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: TextField(
          controller: _queryController,
          focusNode: _focusNode,
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            suffixIcon: _queryController.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Clear search',
                    onPressed: _clearSearch,
                    icon: const Icon(Icons.clear, size: 20),
                  )
                : null,
          ),
          onChanged: _onSearchChanged,
          onSubmitted: (value) => _executeSearch(value),
        ),
      ),
      body: AnimatedBuilder(
        animation: products,
        builder: (context, child) {
          if (products.isLoding && products.product.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (products.errorMessage != null && products.product.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(products.errorMessage!),
                  Gap(h: 12.h),
                  OutlinedButton(
                    onPressed: products.getProduct,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Initial Empty Search State (Suggestions)
          if (_query.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Searches',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(h: 12.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: _quickSearches
                        .map(
                          (tag) => ActionChip(
                            label: Text(tag),
                            onPressed: () => _executeSearch(tag),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            );
          }

          final results = products.search(_query);

          // No Results State
          if (results.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 64.r,
                      color: Colors.grey,
                    ),
                    Gap(h: 16.h),
                    Text(
                      'No products found',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(h: 8.h),
                    Text(
                      'We couldn\'t find any match for "$_query".\nTry checking for typos or search another keyword.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    Gap(h: 20.h),
                    OutlinedButton(
                      onPressed: _clearSearch,
                      child: const Text('Clear Search'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Search Results List/Grid
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Text(
                  'Found ${results.length} result${results.length == 1 ? '' : 's'} for "$_query"',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: .72,
                  ),
                  itemCount: results.length,
                  itemBuilder: (context, index) =>
                      ProdactWidget(product: results[index]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
