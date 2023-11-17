import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../appbar.dart';
import '../input.dart';
import '../scrollable_column.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage() : super();
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool _agreeWithTermsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Registre uma nova conta"),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.network(
                "https://iili.io/JCfXgVV.th.jpg",
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
                      return emailValid ? null : "Email ínvalido";
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
                  CustomInputField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Repita sua senha",
                    obscureText: true,
                    controller: _passwordConfirmationController,
                    validator: (String? password) {
                      if (password == null) {
                        return null;
                      }
                      if (password != _passwordController.value.text) {
                        return "As Senhas são diferentes";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    child: Text("Registre-se"),
                    onPressed: !_agreeWithTermsAndConditions
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.value.text,
                                password: _passwordController.value.text,
                              )
                                  .then((result) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/main', (_) => false);
                              }).catchError((Object exception) {
                                if (exception is FirebaseAuthException) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Falha ao Registrar: ${exception.message}')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Erro de Registro ${exception}')),
                                  );
                                }
                              });
                            }
                          },
                  ),
                  SizedBox(height: 34),
                  CustomCheckbox(
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Criando uma conta você aceita nossos",
                            style: TextStyle(
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        TextButton(
                          child: Text('Termos & Condiççoes'),
                          onPressed: () {
                            print("// Terms & Conditions");
                          },
                        ),
                      ],
                    ),
                    value: _agreeWithTermsAndConditions,
                    onChanged: (checked) => setState(
                        () => _agreeWithTermsAndConditions = checked ?? false),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Já Possui uma conta?",
                        style: TextStyle(
                          color: Color(0xFF8BC34A),
                        ),
                      ),
                      TextButton(
                        child: Text("Login"),
                        onPressed: () =>
                            {Navigator.of(context).pushNamed("/login")},
                      ),
                    ],
                  ),
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
