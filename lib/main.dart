import 'dart:io';

import 'package:crypto_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() async{
  Map currencies= await getCurrencies();
  print(currencies.length);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  
 final Map _currencies;
  MyApp(this._currencies);
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Crypto App',
    home: HomePage(_currencies),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.pink),
  );
  }
}
Future<Map> getCurrencies() async {
    var queryParameters = {
      'start': '1',
      'limit': '5000',
      'convert': 'USD',
    };
    

    String cryptoUrl = "pro-api.coinmarketcap.com";
    var uri = Uri.https(cryptoUrl, "/v1/cryptocurrency/listings/latest", queryParameters);
    http.Response response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: "application/json",
      "X-CMC_PRO_API_KEY": "841ddc60-f64c-432c-a79f-8087f804b8d9"
    });
    return json.decode(response.body);
  }
  // getCurrencies() async {
  //   String url = "https://api.coinranking.com/v1/public/coins";
  //   http.Response res = await http.get(url);
  //   var crypto =jsonDecode(res.body);
   
  // }