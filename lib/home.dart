import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_app/Chat/chat_list.dart';
import 'package:telegram_app/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text(
            'Telegram',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx1) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content:const Text("Are you Sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                signout(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx1).pop();
                                },
                                child:const Text('No'))
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
      ),
      body:const ChatPerson(),
    );
  }

  signout(BuildContext ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const LoginScreen()),
        (route) => false);
  }
}
