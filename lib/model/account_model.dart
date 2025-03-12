class AccountModel {
  String? name;
  String? email;
  String? password;
  String? avatar;
  bool isBiometric;

  AccountModel({
    this.name,
    this.email,
    this.password,
    this.avatar,
    this.isBiometric = false,
  });
}
