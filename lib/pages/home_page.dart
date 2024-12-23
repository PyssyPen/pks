import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/pages/add_page.dart';
import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/api_service.dart';

final List<Tovar> favorite = <Tovar>[];

List<Tovar> products = <Tovar>[];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Tovar>> _products;

  @override
  void initState() {
    super.initState();
    _products = ApiService().getProducts();
  }

  void _removeTovar(int index) {
    ApiService().deleteProduct(index);
    Navigator.pop(context);
  }

  void _addTovar(Tovar tovar) {
    ApiService().createProduct(tovar);
    _products = ApiService().getProducts();
  }

  void _addToFavorite(int index, List list) {
    setState(() {
      if (favorite.contains(list[index]) == false) {
        favorite.add(list[index]);
        Navigator.pop(context, Tovar);
      }
    });
  }

  void _addToCart(int index, List list) {
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
      body: FutureBuilder<List<Tovar>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          }
          products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotePage(
                        tovar: product,
                        onRemove: () {
                          _removeTovar(product.id);
                        },
                        onFavorite: () {
                          _addToFavorite(index, products);
                        },
                        onCart: () {
                          _addToCart(index, products);
                        },
                      ),
                    ),
                  ),
                  child: ItemNote(
                    tovar: product,
                  ),
                );
              },
            ),
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 25, 27, 185),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPage(onAdd: _addTovar, tovar: products[0]),
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
