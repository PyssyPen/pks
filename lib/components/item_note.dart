import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({
    super.key,
    required this.tovar,
  });

  final Tovar tovar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.51,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 137, 23),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  tovar.url,
                  height: 170,
                  width: 170,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 25, 27, 185),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Цена: ${tovar.price}',
                        style:
                            const TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
