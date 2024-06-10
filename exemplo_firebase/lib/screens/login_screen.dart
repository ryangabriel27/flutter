import 'package:exemplo_firebase/screens/todolist_screen.dart';
import 'package:exemplo_firebase/services/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthFirebase _auth = AuthFirebase();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      // tela de registro
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // Formulario de cadastro
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira um email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Senha"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira uma senha";
                  } else if (value!.length < 6) {
                    return "A senha deve conter no mínimo 6 caracteres!!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  child: Text("Login"),
                  onPressed: () async {
                    _login();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      try {
        User? user =
            await _auth.signIn(_emailController.text, _passwordController.text);
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TodoListScreen(
                      user: user,
                    )),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }
}
