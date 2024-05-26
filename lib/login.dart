import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_app/home.dart';
import 'package:telegram_app/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryController = TextEditingController();
  int countrycode = 0;
  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            checkLogin(context);
          } else {
            print('Data is Empty');
          }
        },
        child: const Icon(Icons.east),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 14, 12, 12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your phone number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'please confirm your country code \n and enter your phone number.',
                  style: TextStyle(color: Color.fromARGB(255, 150, 141, 141)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: countryController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 150, 141, 141),
                    ),
                    labelText: 'Country',
                    contentPadding: const EdgeInsets.symmetric(vertical: 2),
                    prefixIcon: const CountryCodePicker(
                      textStyle: TextStyle(color: Colors.white),
                      showFlag: true,
                      showDropDownButton: true,
                      showFlagDialog: true,
                      initialSelection: '+91',
                      favorite: ['+91', 'ind'],
                      alignLeft: false,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 150, 141, 141), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 150, 141, 141), width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _phoneNumberController,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(color: Colors.blueAccent),
                    labelText: 'Phone number',
                    hintText: '00000 00000',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 150, 141, 141)),
                    contentPadding: const EdgeInsets.only(left: 8),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty,Enter your mobile number';
                    } else if (value.length < 10) {
                      return 'Enter atleast 10 numbers!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: const TextStyle(color: Colors.blueAccent),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 150, 141, 141)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty,Enter the Password';
                    } else {
                      return null;
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final enteredPassword = _passwordController.text.trim();
    final enteredNumber = _phoneNumberController.text.trim();
    const errormssg = 'user name or pass word is incorrect';
    print('enteredPassword: $enteredPassword');
    print('enteredNumber: $enteredNumber');

    if (enteredPassword == 'jalal') {
      // print(_errormssg);
      //to home page
      final sharedprefvalue = await SharedPreferences.getInstance();
      await sharedprefvalue.setBool(saveKey, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) =>const  HomeScreen()));
    } else {
      showDialog(
          context: context,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('Error'),
              content:const Text(errormssg),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: const Text('Close'),
                )
              ],
            );
          });
    }
  }
}
