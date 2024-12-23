import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_item.dart';

class CartItemComponent extends StatelessWidget {
  const CartItemComponent({
    super.key,
    required this.cartModel,
    required this.onAdd,
    required this.onDeleate,
    required this.onRemove,
  });

  final CartModel cartModel;
  final VoidCallback onAdd;
  final VoidCallback onDeleate;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 335,
          height: 138,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xE0E0E0E0), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 16, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 0, left: 0, right: 0),
                      child: SizedBox(
                        width: 275,
                        height: 40,
                        child: Text(
                          cartModel.name,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.3,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onRemove,
                      icon: Image.asset(
                        '../Delete.svg',
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 16, left: 16, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SizedBox(
                        width: 60,
                        child: Text(
                          '${cartModel.price} ₽',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 17, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 174,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: SizedBox(
                              width: 75,
                              child: Text(
                                '${cartModel.count} пациент',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                          Container(
                            height: 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFF5F5FA),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Color(0xFF939396),
                                    size: 24,
                                  ),
                                  onPressed: onRemove,
                                ),
                                Container(
                                  width: 1,
                                  height: 26,
                                  color: const Color(0xFFEBEBEB),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Color(0xFF939396),
                                    size: 24,
                                  ),
                                  onPressed: onAdd,
                                ),
                              ],
                            ),
                          ),
                        ],
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
