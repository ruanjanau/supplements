class LoginController {
  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  String? validateLogin() {
    if (_username.isEmpty || _password.isEmpty) {
      return 'Ambos os campos de Login e senha devem estar preenchidos.';
    }

    if (_password.length < 2) {
      return 'A senha deve conter no mínimo 2 caracteres.';
    }

    if (!_password.contains(RegExp(r'^[a-zA-Z0-9]*$'))) {
      return 'A senha não pode conter caracteres especiais.';
    }

    return null;
  }

  void setUsername(String username) {
    _username = username;
  }

  void setPassword(String password) {
    _password = password;
  }
}
