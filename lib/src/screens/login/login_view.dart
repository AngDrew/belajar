import 'package:belajar/src/screens/home/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('Email'),
              ),
            ), // email
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                label: Text('Password'),
              ),
            ), // password
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: validateForm,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void validateForm() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Terjadi kesalahan'),
            content: Text('Email dan Password tidak boleh kosong!'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Oke'),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    }
  }
}
