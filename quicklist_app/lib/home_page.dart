import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const Color iconColor = Color(0xFF4FC3F7);
  static const Color textColor = Color(0xFF8BC34A);

  static const Map<String, String> itemImages = {
    'Carne': 'assets/carne.png',
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
    'Queijo': 'assets/icons8-queijo-80.png',
    'Maçã': 'assets/icons8-maçã-60.png',
    'Abacaxi': 'assets/icons8-abacaxi-96.png',
    'Milho': 'assets/icons8-milho-96.png',
    'Peixe': 'assets/icons8-peixe-96.png',
    'Sal': 'assets/icons8-sal-64.png',
    'Vinho': 'assets/icons8-vinho-64.png',
    'Chocolate': 'assets/icons8-chocolate-64.png',
    'Iogurte': 'assets/icons8-iogurte-64.png',
    'Geléia': 'assets/icons8-strawberry-jam-64.png',
    'Presunto': 'assets/icons8-presunto-64.png',
    'Espaguete': 'assets/icons8-espaguete-96.png',
    'Ketchup': 'assets/icons8-ketchup-64.png',
    'Mostarda': 'assets/icons8-mostarda-68.png',
    'Alho': 'assets/icons8-alho-64.png',
    'Alface': 'assets/icons8-alface-64.png',
    'Cenoura': 'assets/icons8-cenoura-64.png',
    'Uva': 'assets/icons8-uva-64.png',
    'Abóbora': 'assets/icons8-abóbora-64.png',
    'Laranja': 'assets/icons8-laranja-64.png',
    'Limão': 'assets/icons8-lima-96.png',
    'Abacate': 'assets/icons8-abacate-96.png',
    'Pêssego': 'assets/icons8-pêssego-64.png',
    'Melancia': 'assets/icons8-melancia-96.png',
    'Pimenta': 'assets/icons8-pimenta-64.png',
    'Mamão': 'assets/icons8-mamão-96.png',
    'Nozes': 'assets/icons8-nozes-64.png',
    'Amendoim': 'assets/icons8-peanut-24.png',
    'Biscoitos': 'assets/icons8-biscoito-96.png',
    'Bolacha': 'assets/icons8-bolacha-64.png',
    'Sabonete': 'assets/icons8-sabonete-64 (1).png',
    'Shampoo': 'assets/icons8-shampoo-64.png',
    'Condicionador': 'assets/icons8-hair-conditioner-64.png',
    'Escova de dentes': 'assets/icons8-emoji-de-escova-de-dente-96.png',
    'Papel higiênico': 'assets/icons8-papel-higiênico-64.png',
    'Detergente': 'assets/icons8-sabonete-64.png',
    'Saco de lixo': 'assets/icons8-pilha-de-lixo-64.png',
    'Esponja de cozinha': 'assets/icons8-lavar-pratos-96.png',
    'Creme dental': 'assets/icons8-pasta-de-dentes-96.png',
    'Alvejante': 'assets/icons8-cleaning-products-64.png',
    'Água sanitária': 'assets/icons8-água-sanitária-64.png',
    'Maionese': 'assets/icons8-maionese-64.png',
    'Leite condensado': 'assets/icons8-condensed-milk-64.png',
    'Amaciante de roupas': 'assets/icons8-softener-64.png',
    'Mel': 'assets/icons8-mel-64.png',
    'Pipoca': 'assets/icons8-pipoca-50.png',
    'Fio dental': 'assets/icons8-fio-dental-64.png',
    'Gel de cabelo': 'assets/icons8-garrafa-de-creme-64.png',
    'Canela': 'assets/icons8-canela-100.png',
    'Flocos de aveia': 'assets/icons8-aveia-64.png',
    'Temperos': 'assets/icons8-spices-64.png',
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
    'Mostarda', // This item is duplicated
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
    'Pimenta',
    'Mamão',
    'Nozes',
    'Amendoim',
    'Biscoitos',
    'Bolacha',
    'Sabonete',
    'Shampoo',
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
    'Leite condensado',
    'Amaciante de roupas',
    'Mel',
    'Pipoca',
    'Fio dental',
    'Gel de cabelo',
    'Canela',
    'Flocos de aveia',
    'Temperos',
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
            style: const TextStyle(color: textColor),
          ),
          trailing: const Icon(Icons.remove, color: iconColor),
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
            style: const TextStyle(color: textColor),
          ),
          trailing: const Icon(Icons.add, color: iconColor),
          onTap: () {
            setState(() {
              if (selectedItems.contains(items[index])) {
                selectedItems.remove(items[index]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${items[index]} removido da lista'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              } else {
                selectedItems.add(items[index]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${items[index]} adicionado à lista'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            });
          },
        );
      },
    ),
    const Text(
      'Próximos de sua Localização:Feature a ser implementada posteriotmente! Aguarde proxima atualização!',
      style: TextStyle(color: textColor),
    ),
    Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
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
              const Text(
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
        const Padding(
          padding: EdgeInsets.all(16.0),
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
