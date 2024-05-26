import 'package:flutter/material.dart';
import 'package:telegram_app/splash.dart';

const saveKey = 'loggedIn';

void main() {

  runApp(const Telegram());
}

class Telegram extends StatefulWidget {
  const Telegram({super.key});

  @override
  State<Telegram> createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram',
      home: SplashScreen(), 
    );
  }
}
