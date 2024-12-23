import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/chat_page.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign out user
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Это должны быть чаты',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 25, 27, 185),
      body: _buildUserList(),
    );
  }

  //build a list of users
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(
                'Error: ${snapshot.error}'); // Вывод ошибки в консоль для отладки
            return const Text('Error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          if (_auth.currentUser!.email != 'test@gmail.com') {
            return ListView(
              children: snapshot.data!.docs
                  .where((x) => x['email'] == 'test@gmail.com')
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList(),
            );
          }
        });
  }

  //build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current user
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 224, 137, 23), // Оранжевый фон
            borderRadius: BorderRadius.circular(15.0), // Закругленные углы
          ),
          child: Text(
            data['email'],
            style: const TextStyle(color: Colors.white), // Белый текст
          ),
        ),
        onTap: () {
          //pass the user`s UID
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserId: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
