import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/components/fav_item_note.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void _removeTovar(int index) {
    setState(() {
      favorite.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'ИЗБРАННОЕ',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 25, 27, 185),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    '/home/pyssy/VSC/PKS_Android/png/nothing.png',
                    width: 300,
                    height: 300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ничего пока что нет',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ИЗБРАННОЕ',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 25, 27, 185),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: favorite.length,
          itemBuilder: (BuildContext context, int index) {
            return FavItemNote(
              tovar: favorite[index],
              onRemove: () => _removeTovar(index),
            );
          },
        ),
      ),
    );
  }
}
