import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, dynamic> data = {};

Future<List<dynamic>> fetchOrgDataFromApi() async {
  const apiUrl = 'https://resq-api.onrender.com/orgFetch'; // Your API URL

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Parse the JSON response and return it as a Map
    var responseData = json.decode(response.body);
    //print(responseData.toString());
    return responseData;
  } else {
    // Handle the error response here if needed
    throw Exception('Failed to fetch data: ${response.statusCode}');
  }
}
