import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/cart_item.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/models/cart_model.dart';

final List<CartModel> cart = <CartModel>[];
final List<Tovar> tovars = <Tovar>[];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _add(index) {
    setState(() {
      CartModel temp = CartModel(
          url: cart[index].url,
          price: cart[index].price,
          count: cart[index].count + 1);

      cart[index] = temp;
    });
  }

  void _removeAll(index) {
    setState(() {
      cart.removeAt(index);
      tovars.removeAt(index);
    });
  }

  void _deleate(index) {
    setState(() {
      if (cart[index].count == 1) {
        cart.removeAt(index);
        tovars.removeAt(index);
      } else {
        CartModel temp = CartModel(
            url: cart[index].url,
            price: cart[index].price,
            count: cart[index].count - 1);

        cart[index] = temp;
      }
    });
  }

  int _calculateTotal() {
    int total = 0;
    for (var item in cart) {
      total += int.parse(item.price) * item.count;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'КОРЗИНА',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 25, 27, 185),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(cart[index].url),
                    background: Container(
                      color: Colors.red,
                    ),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Подтверждение"),
                            content:
                                const Text("Хотите удалить товар из корзины?"),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("УДАЛИТЬ")),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("ОТМЕНИТЬ"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) {
                      _removeAll(index);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${cart[index].url} удален из корзины')));
                    },
                    child: CartItem(
                      cart: cart[index],
                      onAdd: () => _add(index),
                      onDeleate: () => _deleate(index),
                      onRemove: () => _removeAll(index),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 137, 23),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Итого:',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      '${_calculateTotal().toString()} ₽',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
