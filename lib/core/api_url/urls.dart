class Urls {
  Urls._();
  static const String baseUrl = "https://ecom-rs8e.onrender.com/api";

  ///auth
  static const String getAuthProfile = "$baseUrl/auth/profile";
  static const String postAuthLogin = "$baseUrl/auth/login";
  static const String postAuthSignup = "$baseUrl/auth/signup";
  static const String postAuthVerifyOtp = "$baseUrl/auth/verify-otp";
  static const String postAuthResendOtp = "$baseUrl/auth/resend-otp";
  static const String patchAuthProfileUpdate = "$baseUrl/auth/profile";
  static const String postAuthForgotPassword = "$baseUrl/auth/forgot-password";

  ///brands

  static const String getBrands = "$baseUrl/brands";
  static const String postCreateBrands = "$baseUrl/brands";
  static String patchBrandsByIDUpdate(String id) => "$baseUrl/brands/$id";
  static String deleteBrandsByIDDelete(String id) => "$baseUrl/brands/$id";

  ///categories

  static const String getCategories = "$baseUrl/categories";
  static String getCategoriesByID(String id) => "$baseUrl/categories/$id";
  static const String postCreateCategories = "$baseUrl/categories";
  static String patchCategoriesByIDUpdate(String id) =>
      "$baseUrl/categories/$id";
  static String deleteCategoriesByIDDelete(String id) =>
      "$baseUrl/categories/$id";
  static String postCreateCategoriesImage = "$baseUrl/category";

  ///products

  static const String getProducts = "$baseUrl/products";
  static String getProductsByID(String id) => "$baseUrl/products/id/$id";
  static const String postCreateProducts = "$baseUrl/product";
  static String patchProductsByIDUpdate(String id) => "$baseUrl/products/$id";
  static String deleteProductsByIDDelete(String id) => "$baseUrl/products/$id";

  ///product reviews

  static String getReviewsById(String id) => "$baseUrl/reviews?product=$id";
  static const String postCreateReviews = "$baseUrl/review";
  static String patchReviewsByIDUpdate(String id) => "$baseUrl/reviews/$id";
  static String deleteReviewsByIDDelete(String id) => "$baseUrl/reviews/$id";

  ///Card & Wishlist

  static const String getWishlist = "$baseUrl/wishlist";
  static const String postAddToWishlist = "$baseUrl/wishlist";
  static String deleteWishlistByIDDelete(String id) => "$baseUrl/wishlist/$id";

  static const String getCart = "$baseUrl/cart";
  static const String postAddToCart = "$baseUrl/cart";
  static String deleteCartByIDDelete(String id) => "$baseUrl/cart/$id";
  static String patchCartByIDUpdate(String id) => "$baseUrl/cart/$id";

  ///orders

  static const String getOrders = "$baseUrl/orders";
  static const String postCreateOrders = "$baseUrl/order";
  static String getOrdersByID(String id) => "$baseUrl/orders/$id";
  static String patchOrdersByIDCancel(String id) => "$baseUrl/orders/$id";
  static String patchOrdersByIDUpdate(String id) => "$baseUrl/orders/$id";
  static String deleteOrdersByIDDelete(String id) => "$baseUrl/orders/$id";

  ///slide list
  static const String getSlideList = "$baseUrl/slides";
  static const String postCreateSlideList = "$baseUrl/slides";

  static String deleteSlideListByIDDelete(String id) => "$baseUrl/slides/$id";
}
