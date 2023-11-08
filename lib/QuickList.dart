import 'package:flutter/material.dart';

void main() => runApp(ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primaryColor: Color(0xff0073e6),
        //accentColor: Color(0xff8bc34a),
        textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xff333333))),
        scaffoldBackgroundColor: Color(0xfff5f5f5),
      ),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        // '/passwordRetrieve': (context) => PasswordRetrieve(),Reuperação de senha Sera implementado posteriormente
      },
    );
  }
}

class TopScreenImage extends StatelessWidget {
  final Image screenImageName;

  const TopScreenImage({required this.screenImageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: screenImageName,
    );
  }
}

class ScreenTitle extends StatelessWidget {
  final String title;

  const ScreenTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://i.postimg.cc/qqCScqds/eduardo-soares-Qs-YXYSw-V3-NU-unsplash.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TopScreenImage(
                      screenImageName: Image.network(
                    "https://i.postimg.cc/BvPjZ78x/grocery.png",
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const ScreenTitle(title: 'QuickList'),
                          const Text(
                            'Bem Vindo ao QuickList, uma forma simples e rapida de organizar suas compras',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: SizedBox(
                              width: 329,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff0073e6),
                                ),
                                child: const Text(
                                  'Login',
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
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: SizedBox(
                              width: 329,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'Registre-se',
                                  style: TextStyle(
                                    color: Color(0xff0073e6),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff0073e6),
                      fontSize: 36,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Usuário ou Telefone',
                      labelStyle: TextStyle(
                        color: Color(0xff0073e6),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xff0073e6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xff0073e6),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu usuário ou telefone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Color(0xFF8BC34A),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF8BC34A),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF8BC34A),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
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
                          'Login',
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
                  TextButton(
                    child: const Text(
                      'Esqueci a senha',
                      style: TextStyle(
                        color: Color(0xff0073e6),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/passwordRetrieve');Sera implementado posteriormente
                    },
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
}

class RegisterPage extends StatefulWidget {
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
                    color: Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Usuário',
                    validatorText: 'Por favor, insira um nome de usuário',
                    color: Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Telefone',
                    validatorText: 'Por favor, insira um numero de telefone',
                    color: Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'E-mail',
                    validatorText: 'Por favor, insira um endereço de e-mail',
                    color: Color(0xff0073e6),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Senha',
                    validatorText: 'Por favor, insira sua senha',
                    color: Color(0xFF8BC34A),
                  ),
                  const SizedBox(height: 30),
                  buildField(
                    labelText: 'Repetir Senha',
                    validatorText: 'Por favor, repita sua senha',
                    color: Color(0xFF8BC34A),
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
                      Expanded(
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
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const Color iconColor = Color(0xFF4FC3F7);
  static const Color textColor = Color(0xFF8BC34A);

  static const Map<String, String> itemImages = {
    'Carne': 'https://i.postimg.cc/BXZ5JKj3/carne.png',
    'Leite': 'https://i.postimg.cc/RqBQb89N/caixa-de-leite.png',
    'Feijão': 'https://i.postimg.cc/7Cz0K1W3/sopa-de-feijao-vermelho.png',
    'Arroz': 'https://i.postimg.cc/FYBY5fLT/arroz-1.png',
    'Farinha': 'https://i.postimg.cc/DS8qX3QY/farinha.png',
    'Batata': 'https://i.postimg.cc/DJVm0t5s/batata.png',
    'Tomate': 'https://i.postimg.cc/G8JYCLr9/tomate.png',
    'Pão': 'https://i.postimg.cc/TKFnjNC2/pao.png',
    'Café': 'https://i.postimg.cc/qgxXfLMQ/coffee-590749.png',
    'Banana': 'https://i.postimg.cc/DJq0XBYN/banana-2083677.png',
    'Açúcar': 'https://i.postimg.cc/0MqmF6TL/sugar-4509420.png',
    'Óleo': 'https://i.postimg.cc/t4v0L0v1/5037447.png',
    'Manteiga': 'https://i.postimg.cc/rRMmCxBw/butter-8490572.png',
  };

  List<String> selectedItems = [];

  static List<String> items = [
    'Carne',
    'Leite',
    'Feijão',
    'Arroz',
    'Farinha',
    'Batata',
    'Tomate',
    'Pão',
    'Café',
    'Banana',
    'Açúcar',
    'Óleo',
    'Manteiga',
  ];

  List<Widget> _widgetOptions() => <Widget>[
        ListView.builder(
          itemCount: selectedItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(itemImages[selectedItems[index]]!,
                  height: 40, width: 40, fit: BoxFit.cover),
              title: Text(
                selectedItems[index],
                style: TextStyle(color: textColor),
              ),
              trailing: Icon(Icons.remove, color: iconColor),
              onTap: () {
                setState(() {
                  selectedItems.removeAt(index);
                });
              },
            );
          },
        ),
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(itemImages[items[index]]!,
                  height: 40, width: 40, fit: BoxFit.cover),
              title: Text(
                items[index],
                style: TextStyle(color: textColor),
              ),
              trailing: Icon(Icons.add, color: iconColor),
              onTap: () {
                setState(() {
                  if (selectedItems.contains(items[index])) {
                    selectedItems.remove(items[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${items[index]} removido da lista'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    selectedItems.add(items[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${items[index]} adicionado à lista'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                });
              },
            );
          },
        ),
        Text(
          'Próximos de sua Localização:Feature a ser implementada posteriotmente! Aguarde proxima atualização!',
          style: TextStyle(color: textColor),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Configurações do usuário',
                style: TextStyle(
                  color: iconColor,
                  fontSize: 36,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Habilitar notificações',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Switch(
                      value: false,
                      onChanged: (bool newValue) {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: textColor,
                        size: 32,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Nome do Usuário',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: textColor,
                        size: 32,
                      ),
                      SizedBox(width: 16),
                      Text(
                        '1 dispositivos conectados',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket, color: iconColor),
            label: 'Lista',
            activeIcon: Icon(Icons.shopping_basket, color: textColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: iconColor),
            label: 'Add Itens',
            activeIcon: Icon(Icons.search, color: textColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: iconColor),
            label: 'Proximos',
            activeIcon: Icon(Icons.location_on, color: textColor),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: iconColor),
            label: 'Configurações',
            activeIcon: Icon(Icons.settings, color: textColor),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: textColor,
        unselectedItemColor: iconColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
