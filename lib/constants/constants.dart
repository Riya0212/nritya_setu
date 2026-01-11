
bool isEmail(String email) {
  String mail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(mail);
  return regExp.hasMatch(email);
}

bool isPassword(String password) {
  String passwordPattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
  RegExp regExp = RegExp(passwordPattern);
  return regExp.hasMatch(password);
}