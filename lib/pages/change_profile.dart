import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile_model.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({
    super.key,
    required this.profile,
    required this.onChange,
  });

  final Profile profile;

  final Function(Profile) onChange;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _urlController =
        TextEditingController(text: profile.url);

    final TextEditingController _nameController =
        TextEditingController(text: profile.name);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Изменение профиля',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 224, 137, 23)), // Change color here
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              style: const TextStyle(fontSize: 24, color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Введите новый URL',
              ),
              maxLines: 2,
            ),
            TextField(
              controller: _nameController,
              style: const TextStyle(fontSize: 24, color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Введите новое имя',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                final url = _urlController.text;
                final name = _nameController.text;
                if (url.isNotEmpty) {
                  if (name.isNotEmpty) {
                    onChange(Profile(
                      url: url,
                      name: name,
                    ));
                    Navigator.pop(context, Profile);
                  }
                }
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Сохранить изменения'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 27, 185),
    );
  }
}
