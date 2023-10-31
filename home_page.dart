import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const Color iconColor = Color(0xFF4FC3F7);
  static const Color textColor = Color(0xFF8BC34A);

  static const Map<String, String> itemImages = {
     'Carne': 'assets/carne.png'
    'Leite': 'assets/caixa-de-leite.png',
    'Feijão': 'assets/sopa-de-feijao-vermelho.png',
    'Arroz': 'assets/arroz-1.png',
    'Farinha': 'assets/farinha.png',
    'Batata': 'assets/batata.png',
    'Tomate': 'assets/tomate.png',
    'Pão': 'assets/pao.png',
    'Café': 'assets/coffee-590749.png',
    'Banana': 'assets/banana-2083677.png',
    'Açúcar': 'assets/sugar-4509420.png',
    'Óleo': 'assets/5037447.png',
    'Manteiga': 'assets/butter-8490572.png',
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
'Queijo',
'Maçã',
'Abacaxi',
'Milho',
'Peixe',
'Sal',
'Vinho',
'Chocolate',
'Iogurte',
'Geléia',
'Presunto',
'Espaguete',
'Ketchup',
'Mostarda',
'Alho',
'Alface',
'Cenoura',
'Uva',
'Abóbora',
'Laranja',
'Limão',
'Abacate',
'Pêssego',
'Melancia',
'Pimentão',
'Mamão',
'Nozes',
'Amendoim',
'Biscoitos',
'Bolacha',
'Sabonete',
'Shamppo',
'Condicionador',
'Escova de dentes',
'Papel higiênico',
'Detergente',
'Saco de lixo',
'Esponja de cozinha',
'Creme dental',
'Alvejante',
'Água sanitária',
'Maionese',
'Mostarda',
'Leite condensado',
'Amaciante de roupas',
'Amendoim',
'Queijo ralado',
'Mel',
'Pipoca',
'Fio dental',
'Condicionador de cabelo',
'Gel de cabelo',
'Canela',
'Flocos de aveia',
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
