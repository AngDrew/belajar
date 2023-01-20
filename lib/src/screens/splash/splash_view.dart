import 'package:belajar/src/screens/login/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    validateAuthToken();
  }

  Future<void> validateAuthToken() async {
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'images/header-splash.png',
              fit: BoxFit.contain,
              width: size.width,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/logo.png',
              width: size.width,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/footer-splash.png',
              fit: BoxFit.contain,
              width: size.width,
            ),
          ),
        ],
      ),
    );
  }
}
