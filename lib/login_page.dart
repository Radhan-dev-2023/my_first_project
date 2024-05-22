import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void login(String email,String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'),
              body: {
        'email': email,
        'password': password,
      });
      const snackBar = SnackBar(
        content: Text('Login Successfull'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (response.statusCode == 200) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomeScreen())
  );


      }
      else{
        const snackBar = SnackBar(
          content: Text('Please Check Email and Password'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Error created");
      }
    } catch (e) {
      var snackBar = SnackBar(
        content: Text("$e"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }


  Future<bool> useraction()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();

   return await preferences.setBool('authenticated',true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              login(_emailController.text, _passwordController.text);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                "Login",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
