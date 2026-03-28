// * http package

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  // print(response.body);
  final data = jsonDecode(response.body);
  print(data[0]['title']);
}

// instead of using data['title'] we create a model class best  practice

class Post {
  final int id;
  final String title;
  final String body;
}
