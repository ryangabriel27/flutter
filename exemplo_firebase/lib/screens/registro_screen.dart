import 'package:exemplo_firebase/screens/login_screen.dart';
import 'package:exemplo_firebase/services/auth_firebase.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final AuthFirebase _authFirebase = AuthFirebase();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                  } else if (value! == _confirmPasswordController.value) {
                    return "As senhas devem ser iguais!!";
                  } else if (value!.length < 6) {
                    return "A senha deve conter no mínimo 6 caracteres!!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: "Confirmar Senha"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira uma senha";
                  } else if (value! == _passwordController.value) {
                    return "As senhas devem ser iguais!!";
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
                  child: Text("Registrar"),
                  onPressed: () async {
                    _registrarUsuario();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registrarUsuario() async {
    if (formKey.currentState!.validate()) {
      try {
        await _authFirebase.signUp(
            _emailController.text, _passwordController.text);
        // Mensagem scaffold
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Usuário cadastrado com sucesso!"),
            duration: Duration(seconds: 2),
          ),
        );
        // Redirecionar para tela de login
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      } catch (e) {
        print(e);
      }
    }
  }
}
