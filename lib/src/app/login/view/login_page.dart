import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = LoginController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextFormFieldCustom(
            text: 'Usuário',
            icon: Icons.person,
            controller: _usernameController,
          ),
          const SizedBox(height: 20),
          TextFormFieldCustom(
            text: 'Senha',
            icon: Icons.password,
            controller: _passwordController,
          ),
          const SizedBox(height: 30),
          ButtonCustom(
            text: 'Entrar',
            onPressed: () {
              String username = _usernameController.text;
              String password = _passwordController.text;

              loginController.setUsername(username);
              loginController.setPassword(password);

              String? validationMsg = loginController.validateLogin();
              if (validationMsg != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(validationMsg),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/products');
                });
              }
            },
          )
        ],
      ),
    );
  }
}
