import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              '/home/pyssy/VSC/PKS_Android/7/Home.png',
              scale: 4,
              color: Colors.grey,
            ),
            activeIcon: Image.asset('/home/pyssy/VSC/PKS_Android/7/Home.png',
                scale: 4, color: const Color(0xFF196EEE)),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              '/home/pyssy/VSC/PKS_Android/7/Cart.png',
              scale: 4,
              color: Colors.grey,
            ),
            activeIcon: Image.asset('/home/pyssy/VSC/PKS_Android/7/Cart.png',
                scale: 4, color: const Color(0xFF196EEE)),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              '/home/pyssy/VSC/PKS_Android/7/User.png',
              scale: 4,
              color: Colors.grey,
            ),
            activeIcon: Image.asset('/home/pyssy/VSC/PKS_Android/7/User.png',
                scale: 4, color: const Color(0xFF196EEE)),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF196EEE),
        unselectedItemColor: Colors.grey, // Цвет для невыбранных элементов
        selectedLabelStyle:
            const TextStyle(color: Colors.grey), // Цвет для выбранного элемента
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }
}
