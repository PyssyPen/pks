import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key, required this.tovar, required this.onAdd});

  final Tovar tovar;

  final Function(Tovar) onAdd;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _urlController =
        TextEditingController(text: tovar.url);

    final TextEditingController _priceController =
        TextEditingController(text: tovar.price);

    final TextEditingController _discriptionController =
        TextEditingController(text: tovar.discription);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Добавление товара',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Enter url',
              ),
              maxLines: 5,
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Enter price',
              ),
              maxLines: 5,
            ),
            TextField(
              controller: _discriptionController,
              decoration: const InputDecoration(
                labelText: 'Enter discription',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final url = _urlController.text;
                final price = _priceController.text;
                final discription = _discriptionController.text;
                if (url.isNotEmpty) {
                  if (price.isNotEmpty) {
                    if (discription.isNotEmpty) {
                      onAdd(Tovar(
                          url: url, price: price, discription: discription));
                      Navigator.pop(context, Tovar);
                    }
                  }
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
