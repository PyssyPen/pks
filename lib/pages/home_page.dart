import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/components/item_component.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:flutter_application_1/models/cart_item.dart';

final List<Item> list = <Item>[
  Item(
      name: 'ПЦР-тест на определение РНК коронавируса стандартный',
      price: '1800',
      day: '2 дня'),
  Item(
      name: 'Клинический анализ крови с лейкоцитарной формулировкой',
      price: '690',
      day: '1 день'),
  Item(
      name: 'Биохимический анализ крови, базовый', price: '2440', day: '1 день')
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addToCart(int index) {
    setState(() {
      if (tovars.contains(list[index]) == false) {
        tovars.add(list[index]);

        CartModel temp = CartModel(
            name: list[index].name, price: list[index].price, count: 1);
        cart.add(temp);
      } else {
        int tempInd = tovars.indexOf(list[index]);

        CartModel temp = CartModel(
            name: cart[tempInd].name,
            price: cart[tempInd].price,
            count: cart[tempInd].count + 1);

        cart[tempInd] = temp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: SizedBox(
            width: 335,
            child: Text(
              'Каталог услуг',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: ItemNote(
                item: list[index],
                addToCart: () {
                  _addToCart(index);
                },
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
