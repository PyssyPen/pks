import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/pages/add_page.dart';
import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/models/cart_model.dart';

final List<Tovar> list = <Tovar>[
  Tovar(
      url: '/home/pyssy/VSC/PKS_Android/png/1.png',
      price: '999',
      discription: 'GBCZ 1')
];

final List<Tovar> favorite = <Tovar>[];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _removeTovar(int index) {
    setState(() {
      list.removeAt(index);
      Navigator.pop(context, Tovar);
    });
  }

  void _addToFavorite(int index) {
    setState(() {
      if (favorite.contains(list[index]) == false) {
        favorite.add(list[index]);
        Navigator.pop(context, Tovar);
      }
    });
  }

  void _addToCart(int index) {
    setState(() {
      if (tovars.contains(list[index]) == false) {
        tovars.add(list[index]);

        CartModel temp =
            CartModel(url: list[index].url, price: list[index].price, count: 1);
        cart.add(temp);
      } else {
        int tempInd = tovars.indexOf(list[index]);

        CartModel temp = CartModel(
            url: cart[tempInd].url,
            price: cart[tempInd].price,
            count: cart[tempInd].count + 1);

        cart[tempInd] = temp;

        Navigator.pop(context, Tovar);
      }
    });
  }

  void _addTovar(Tovar tovar) {
    setState(() {
      list.add(tovar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ТОВАРЫ',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotePage(
                    tovar: list[index],
                    onRemove: () {
                      _removeTovar(index);
                    },
                    onFavorite: () {
                      _addToFavorite(index);
                    },
                    onCart: () {
                      _addToCart(index);
                    }, // addToCart
                  ),
                ),
              ),
              child: ItemNote(
                tovar: list[index],
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 27, 185),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPage(onAdd: _addTovar, tovar: list[0]),
          ),
        ),
        hoverColor: Colors.black,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 224, 137, 23),
        child: const Icon(Icons.add),
      ),
    );
  }
}
