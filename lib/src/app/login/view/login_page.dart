import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

import '../../components/components.dart';
import '../components/components.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = LoginController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.redAccent,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Center(
                child: Hero(
                  tag: 'splash',
                  child: Image.asset(
                    'assets/image/j.png',
                    height: 160,
                  ),
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .moveY(
                    begin: -25,
                    end: 8,
                    curve: Curves.easeInOut,
                    duration: 1000.ms,
                  )
                  .then()
                  .moveY(
                    begin: 8,
                    end: -25,
                    curve: Curves.easeInOut,
                    duration: 1000.ms,
                  ),
              const SizedBox(height: 10),
              const ShadowContainer(),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomTextField(
                        text: 'Usuário',
                        icon: Icons.person,
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        text: 'Senha',
                        icon: Icons.lock,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 58),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ).animate().slide().fade(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        color: Colors.redAccent,
                        text: '  Entrar  ',
                        onPressed: () {
                          String username = _usernameController.text;
                          String password = _passwordController.text;

                          loginController.setUsername(username);
                          loginController.setPassword(password);

                          String? validationMsg =
                              loginController.validateLogin();
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
                              Navigator.pushNamed(context, '/home');
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
