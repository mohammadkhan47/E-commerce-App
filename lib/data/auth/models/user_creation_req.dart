class UserCreationReq {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  int ? gender;
  String? age;

  UserCreationReq({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
});
}