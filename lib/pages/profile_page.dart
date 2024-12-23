import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';

Profile profile = Profile(
    name: 'PyssyPen', number: '+7 800 555 35 35', email: 'pyssypen@gmail.com');

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            width: 335,
            child: Text(
              profile.name,
              style: const TextStyle(
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
        padding: const EdgeInsets.all(0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 335,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 0, right: 0),
                  child: Text(
                    profile.number,
                    style: const TextStyle(
                      color: Color(0xFF898A8D),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 335,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 45, left: 0, right: 0),
                  child: Text(
                    profile.email,
                    style: const TextStyle(
                      color: Color(0xFF898A8D),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 335,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 0, right: 25),
                      child: Image.asset(
                        '/home/pyssy/VSC/PKS_Android/7/Icon.png',
                        scale: 4,
                      ),
                    ),
                    const Text(
                      'Мои заказы',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 335,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 0, right: 25),
                      child: Image.asset(
                        '/home/pyssy/VSC/PKS_Android/7/Icon(1).png',
                        scale: 4,
                      ),
                    ),
                    const Text(
                      'Медицинские карты',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 335,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 0, right: 25),
                      child: Image.asset(
                        '/home/pyssy/VSC/PKS_Android/7/Icon(2).png',
                        scale: 4,
                      ),
                    ),
                    const Text(
                      'Мои адреса',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 335,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 0, right: 25),
                      child: Image.asset(
                        '/home/pyssy/VSC/PKS_Android/7/Icon(3).png',
                        scale: 4,
                      ),
                    ),
                    const Text(
                      'Настройки',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(27, 48, 27, 0),
                  child: Column(
                    children: [
                      Text(
                        'Ответы на вопросы',
                        style: TextStyle(
                          color: Color(0xFF939396),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Политика конфиденциальности',
                        style: TextStyle(
                          color: Color(0xFF939396),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Пользовательское соглашение',
                        style: TextStyle(
                          color: Color(0xFF939396),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Выход',
                        style: TextStyle(
                          color: Color(0xFFFD3535),
                          fontSize: 15,
                        ),
                      ),
                    ],
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
