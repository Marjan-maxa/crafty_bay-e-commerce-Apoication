class Urls {
  static const _baseUrl='https://ecom-rs8e.onrender.com/api';
  static const signUpUrl='$_baseUrl/auth/signup';
  static const otpUrl='$_baseUrl/auth/verify-otp';
  static const signInUrl='$_baseUrl/auth/login';
  static const  homeSliderUrl='$_baseUrl/slides';
  static   getcategoryUrl(int pageSize,int pageNo)=>'$_baseUrl/categories?count=$pageSize&page=$pageNo';



}