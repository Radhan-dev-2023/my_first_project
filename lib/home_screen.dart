import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled5/second_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Product {}

String? items;
Map? count;

class _HomeScreenState extends State<HomeScreen> {
  Future<void> apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        // items = response.body;
        count = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            color: Colors.greenAccent,
            child: Text(
              count!['data'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            color: Colors.greenAccent,
            child: Text(
              count!['data']['id'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            color: Colors.greenAccent,
            child: Text(
              count!['data']['email'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            color: Colors.greenAccent,
            child: Text(
              count!['data']['first_name'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            color: Colors.greenAccent,
            child: Text(
              count!['data']['last_name'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
              // margin: const EdgeInsets.all(12),
              // padding: const EdgeInsets.all(12),
              color: Colors.greenAccent,
              child: Image.network(
                count!['data']['avatar'].toString(),
              )),
          const SizedBox(height: 20),
          Center(
            child: TextButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, padding: const EdgeInsets.all(15)),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const SecondPage()));
              },
              child: const Text(
                "Second Page",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
