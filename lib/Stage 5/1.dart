// * http package

import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  print(response.body);
}
