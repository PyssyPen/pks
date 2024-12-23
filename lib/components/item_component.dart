import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.item, required this.addToCart});

  final Item item;
  final VoidCallback addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 335,
          height: 136,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xE0E0E0E0), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 303,
                  height: 40,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.3,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                            width: 60,
                            child: Text(
                              item.day,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                color: Color(0xFF939396),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                            width: 60,
                            child: Text(
                              '${item.price} ₽',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 17, fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color(0xFF196EEE),
                        ),
                        onPressed: addToCart,
                        child: const Text(
                          'Добавить',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
