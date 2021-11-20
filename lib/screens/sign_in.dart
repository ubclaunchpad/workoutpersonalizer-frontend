import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workoutpersonalizer_frontend/main.dart';
import 'package:provider/provider.dart';
import 'package:workoutpersonalizer_frontend/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: Form(
          key: _key,
          child: Center(
              child: Column(
            children: [
              TextFormField(
                controller: userEmailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: validateEmail,
              ),
              TextFormField(
                controller: userPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: validatePassword,
              ),
              Center(
                child: Text(errorMessage, style: const TextStyle(
                  color: Colors.red
                )),
              ),
              TextButton(
                  onPressed: () async {
                    await createAccount(authService);
                  },
                  child: const Text("Create Account")),
              TextButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      await logIn(authService);
                    }
                    setState(() {});
                  },
                  child: const Text("Sign In")),
              TextButton(
                  onPressed: () async {
                    await signIn(authService);
                  },
                  child: const Text("Log out")),
              TextButton(
                  onPressed: () async {
                    await forgotPassword(authService);
                  },
                  child: const Text("Forgot Password"))
            ],
          )),
        ),
      ),
    );
  }

  Future<void> createAccount(AuthService authService) async {
    try {
      await authService.createAccount(
          userEmailController.text, userPasswordController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    }
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail is required';
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  Future<void> logIn(AuthService authService) async {
    try {
      await authService.signIn(
          userEmailController.text, userPasswordController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    }
  }

  Future<void> forgotPassword(AuthService authService) async {
    try {
      authService.forgotPassword(userEmailController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    }
  }

  Future<void> signIn(AuthService authService) async {
    try {
      await authService.signIn(
          userEmailController.text, userPasswordController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message!;
    }
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<User?>();

    if (currentUser == null) {
      return SignIn();
    }
    return const MyHomePage(title: 'Flutter Demo Home Page');
  }
}
