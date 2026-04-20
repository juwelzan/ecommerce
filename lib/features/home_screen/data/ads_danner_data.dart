import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/home_screen/model/banner_model.dart';
import 'package:ecommerce/shared/path/paths.dart';

class AdsBannerData {
  AdsBannerData._();
  static List<BannerModel> bannerData = <BannerModel>[];
  static List<Widget> bannerImge = <Widget>[];

  static void bannerSeparate(Map<String, dynamic> data) {
    final results = data['data']?["results"] as List?;
    if (results == null) return;
    List<BannerModel> bannerList = results
        .map((e) => BannerModel.fromJson(e))
        .toList();

    bannerData.addAll(bannerList);
    LoggerLog.logI('''
    ${bannerList.length}
    ${bannerList[0].imgUrl}

    ${bannerList[3].description}

    ${bannerList[0].product}
    ${bannerList[0].brand}
    ${bannerList[0].category}
    ${bannerList[0].createdAt}
    ''');
    getBannerImge(bannerList.length);
  }

  static void getBannerImge(int length) {
    List<Widget> banner = length == 0
        ? []
        : List.generate(length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: ClipRRect(
                borderRadius: .circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: bannerData[index].imgUrl!,
                  fit: BoxFit.cover,
                  height: 150.h,
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            );
          });

    bannerImge.addAll(banner);
  }
}
