class Otpparams {
  final String email;
  final String otP;

  Otpparams({required this.email, required this.otP});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otP,
    };
  }
}
