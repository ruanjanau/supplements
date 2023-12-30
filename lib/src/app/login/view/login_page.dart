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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              children: [
                Center(
                    child: Hero(
                  tag: 'splash',
                  child: Image.asset(
                    'assets/image/j.png',
                    height: 160,
                  ),
                )),
                const SizedBox(height: 20),
                TextFormFieldCustom(
                  text: 'Usuário',
                  icon: Icons.person,
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),
                TextFormFieldCustom(
                  text: 'Senha',
                  icon: Icons.lock,
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
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/bloc/products/');
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
