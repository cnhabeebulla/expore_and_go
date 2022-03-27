

emailValidator(String val) {
  //print("call recived {$val}")
  return val.isEmpty ||
          !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(val)
      ? "Enter a valid email id"
      : null;
}

String? passwordValidator(String val) {
  return val.isEmpty || val.length < 8
      ? "Lenght must be at least 8 character"
      : null;
}

String? usernameValidator(String val) {
  return val.isEmpty || val.length < 2 ? "Enter a valid name" : null;
}


