import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:untitled5/Bottomsheetstate.dart';

import 'currency.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Eur> fetchEur() async {
  final response = await http
      .get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
  if (response.statusCode == 200) {
    return Eur.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

void main() => runApp(const Myaa());

class Myaa extends StatefulWidget {
  const Myaa({super.key});

  @override
  State<Myaa> createState() => _MyaaState();
}

class _MyaaState extends State<Myaa> {
  @override
  void initState() {
aaa();
    super.initState();
  }

void aaa()async{
  var box = await Hive.openBox('myBox');

  var person = Person()
    ..name = 'Dave'
    ..age = 22;
  box.add(person);

  print(box.getAt(0));

  person.age = 30;
  person.toString();

  print(box.getAt(0));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}

class Person {
   late final String? name;
 late final int? age;
 Person({
   this.name, this.age
 });
}


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late Future<Album> futureAlbum;
//   late Future<Eur> gggg;
//
//   @override
//   void initState() {
//     super.initState();
//     futureAlbum=fetchAlbum();
//     gggg = fetchEur();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<BottomSheetState>(
//         create: (context) => BottomSheetState(),
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Fetch Data Example',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           ),
//           home: Scaffold(
//             appBar: AppBar(
//               title: const Text('Fetch Data Example'),
//             ),
//             body: Center(
//               child: FutureBuilder<Album>(
//                 future: futureAlbum,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(10)),
//                       padding: EdgeInsets.all(10),
//                       margin: EdgeInsets.all(9),
//                       child: Column(
//                         children: [
//                           Text(snapshot.data!.title.toString()),
//                           Text(snapshot.data!.userId.toString()),
//                           Text(snapshot.data!.id.toString()),
//                         ],
//                       ),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   return const CircularProgressIndicator();
//                 },
//               ),
//             ),
//           ),
//         ));
//   }
// }
