class AuthModel {
  String firstName;
  String lastName;
  String dob;
  String gender;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;
  String country;
  String countryCode;
  bool isTermsAccepted;
  bool isLoading;
  bool isAuth;
  String? error;

  AuthModel({
    this.firstName = '',
    this.lastName = '',
    this.dob = '',
    this.gender = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.country = '',
    this.countryCode = '',
    this.isTermsAccepted = false,
    this.isLoading = false,
    this.isAuth = false,
    this.error,
  });
}
