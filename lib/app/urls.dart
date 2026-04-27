class Urls {
  static const _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const signUpUrl = '$_baseUrl/auth/signup';
  static const otpUrl = '$_baseUrl/auth/verify-otp';
  static const signInUrl = '$_baseUrl/auth/login';
  static const homeSliderUrl = '$_baseUrl/slides';
  static getcategoryUrl(int count, int page) {
    return "$_baseUrl/categories?page=$page&count=$count";
  }

  static getproductUrl(int count, int page) {
    return "$_baseUrl/products?page=$page&count=$count";
  }

  static getproductDetailsUrl(String productId) {
    return "$_baseUrl/products/id/$productId";
  }
}
