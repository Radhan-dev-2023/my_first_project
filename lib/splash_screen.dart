import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/login_page.dart';

import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () =>
                //authenticateuser().then((authenticateuser)  {
              // if(authenticateuser){
              //   Navigator.pushReplacement(context,
              //       MaterialPageRoute(builder: (context) => Screen1() ));
              // }
              // else{
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>LoginPage() )));
              // }
             // }

           // ) );
  }
  Future<bool> authenticateuser()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return preferences.getBool('authenticateuser')??false;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: Column(
        children: [
          Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQisj72BQGoUHqKyYHziI1yGYfcg60HvKFJKRa4npGkXg&s',
               width: MediaQuery.of(context).size.width*4,
                height: 820,
                fit: BoxFit.cover,
              )),
          const CircularProgressIndicator(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
