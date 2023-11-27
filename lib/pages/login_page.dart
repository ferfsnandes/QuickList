import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../appbar.dart';
import '../input.dart';
import '../scrollable_column.dart';

class LoginPage extends StatefulWidget {
  const LoginPage() : super();
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bem vindo de volta! Login em Quicklist"),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                "https://iili.io/JCfhS7n.md.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Form(
              key: _formKey,
              child: ScrollableColumn(
                children: [
                  CustomInputField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    controller: _emailController,
                    validator: (String? email) {
                      if (email == null) {
                        return null;
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      return emailValid ? null : "Email inválido";
                    },
                  ),
                  SizedBox(height: 24),
                  CustomInputField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Senha",
                    obscureText: true,
                    controller: _passwordController,
                    validator: (String? password) {
                      if (password == null) {
                        return null;
                      }
                      if (password.length < 6) {
                        return "Caracteres Insuficientes";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  CustomCheckbox(
                    labelText: "Permanecer Conectado",
                    value: _rememberMeChecked,
                    onChanged: (checked) =>
                        setState(() => _rememberMeChecked = checked ?? false),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    child: Text("Login"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _emailController.value.text,
                          password: _passwordController.value.text,
                        )
                            .then((result) {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/main', (_) => false);
                        }).catchError((Object exception) {
                          if (exception is FirebaseAuthException) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Usuario ou Senha Incorreta: ${exception.message}')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Erro de Autorização ${exception}')),
                            );
                          }
                        });
                      }
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Não Possui Conta?",
                        style: TextStyle(
                          color: Color(0xFF8BC34A),
                        ),
                      ),
                      TextButton(
                        child: Text("Registre-se"),
                        onPressed: () =>
                            {Navigator.of(context).pushNamed("/register")},
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Deseja Voltar ao inicio?",
                        style: TextStyle(
                          color: Color(0xffea4f4f),
                        ),
                      ),
                      TextButton(
                        child: Text("Inicio"),
                        onPressed: () => {Navigator.of(context).pushNamed("/")},
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
