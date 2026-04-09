// "data":{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2OWQ2OTMzYzM1ZjI3NTQ1NGU4NTIwN2IiLCJmaXJzdF9uYW1lIjoiTXIiLCJsYXN0X25hbWUiOiJNYXJqYW4iLCJlbWFpbCI6IndlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZSI6IjAxOTU0MjMzMzg3IiwicGhvbmVfdmVyaWZpZWQiOmZhbHNlLCJhdmF0YXJfdXJsIjpudWxsLCJjaXR5IjoiUmFuZ3B1ciIsInJvbGUiOjAsImlhdCI6MTc3NTY3MDA4MywiZXhwIjoxNzc2Mjc0ODgzfQ.rxqs1OShSz2dEhPIZF-bVVzoxayJBMml6VFjNVcS6LA",
// "user":{"
// _id":"69d6933c35f275454e85207b",
// "first_name":"Mr",
// "last_name":"Marjan",
// "email":"we@gmail.com",
// "email_verified":true,
// "phone":"01954233387",
// "phone_verified":false,
// "avatar_url":null,
// "city":"Rangpur","role":0}}}

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String city;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
     this.avatarUrl,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      avatarUrl: json['avatar_url'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'city': city,

    };
  }
}
