import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/cart_item_component.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/models/item.dart';

final List<CartModel> cart = <CartModel>[];
final List<Item> tovars = <Item>[];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _add(index) {
    setState(() {
      CartModel temp = CartModel(
          name: cart[index].name,
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
            name: cart[index].name,
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
          child: SizedBox(
            width: 335,
            child: Text(
              'Корзина',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: CartItemComponent(
                      cartModel: cart[index],
                      onAdd: () {
                        _add(index);
                      },
                      onRemove: () {
                        _removeAll(index);
                      },
                      onDeleate: () {
                        _deleate(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 120, left: 0, right: 0),
              child: Container(
                width: 335,
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Итого:',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${_calculateTotal().toString()} ₽',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 26, left: 0, right: 0),
              child: Container(
                width: 335,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF196EEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Перейти к оформлению заказа',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
