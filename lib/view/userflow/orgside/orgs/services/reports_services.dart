import 'dart:convert';


import 'package:http/http.dart' as http;

Map<String, dynamic> data = {};

Future<List<dynamic>> fetchDataFromApi() async {
  const apiUrl = 'https://resq-api.onrender.com/reportFetch'; // Your API URL

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Parse the JSON response and return it as a Map
    var responseData = json.decode(response.body);
    print(responseData.toString());
    return responseData;
    print(responseData);
    print("af");
  } else {
    // Handle the error response here if needed
    throw Exception('Failed to fetch data: ${response.statusCode}');
  }
}
