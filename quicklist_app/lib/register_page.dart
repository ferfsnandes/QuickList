import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://i.postimg.cc/dVCmjCXN/eduardo-soares-e4-Em-Px91-Aj4-unsplash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Text(
                    'Registre-se',
                    style: TextStyle(
                      color: Color(0xff0073e6),
                      fontSize: 36,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Nome',
                    validatorText: 'Por favor, insira seu nome',
                    color: const Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Usuário',
                    validatorText: 'Por favor, insira um nome de usuário',
                    color: const Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Telefone',
                    validatorText: 'Por favor, insira um numero de telefone',
                    color: const Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'E-mail',
                    validatorText: 'Por favor, insira um endereço de e-mail',
                    color: const Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Senha',
                    validatorText: 'Por favor, insira sua senha',
                    color: const Color(0xFF8BC34A),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Repetir Senha',
                    validatorText: 'Por favor, repita sua senha',
                    color: const Color(0xFF8BC34A),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptedTerms,
                        onChanged: (value) {
                          setState(() {
                            _acceptedTerms = value!;
                          });
                        },
                      ),
                      const Expanded(
                          child: Text('Aceito os termos e condições',
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: 329,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8BC34A),
                        ),
                        child: const Text(
                          'Registre-se',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: 329,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/landing');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffd32f2f),
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildField({
    required String labelText,
    required String validatorText,
    required Color color,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: color,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: color,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
