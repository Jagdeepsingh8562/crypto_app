import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Map currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.indigo,
    Colors.red,
  ];
  // @override
  // void initState() async {
  //   super.initState();
  //   currencies = await getCurrencies();
  // }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
        centerTitle: true,
      ),
      body: currencies == null
          ? Center(child: CircularProgressIndicator())
          : cryptoWidget(),
    );
  }

  Widget cryptoWidget() {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Map currency=widget.currencies[index];
          final MaterialColor colors=_colors[index % _colors.length];
          return _getListitems(currency,colors);
        },
        itemCount: widget.currencies.length,
      ),
    );
  }
}
 Widget _getListitems(Map currency,MaterialColor colors){
   return ListTile(
     leading: CircleAvatar(backgroundColor: colors,child: Text(currency['data']['name']),),
     title: Text(currency['data']['name'],style: TextStyle(fontWeight: FontWeight.bold),),
     subtitle: _getSubtitle(currency['quote']['USD']['price'].toString(),currency['quote']['USD']['percent_change_1h'].toString()),
     isThreeLine: true,
   );
 }
Widget _getSubtitle(String price,String change){
  TextSpan priceTextwidget=TextSpan(text: '\$$price\n',style: TextStyle(color: Colors.black));
  String percentchangeText= '1 hours:$change';
  TextSpan percentchangeTextWidget;

  if (double.parse(change)>0){
    percentchangeTextWidget = TextSpan(text: percentchangeText,style: TextStyle(color: Colors.green));
  }
  else{
    percentchangeTextWidget = TextSpan(text: percentchangeText,style: TextStyle(color: Colors.red));
  }
  return RichText(text: TextSpan(children: [priceTextwidget,percentchangeTextWidget]),);
}


//
// getCurrencies() async {
//     var queryParameters = {
//     'start': '1',
//     'limit': '5000',
//     'convert': 'USD',
//   };

//   String cryptoUrl = "pro-api.coinmarketcap.com";
//   var uri =Uri.https(cryptoUrl,"/v1/cryptocurrency/listings/latest",queryParameters);

//   http.Response response = await http.get(uri,
//     headers: {HttpHeaders.acceptHeader:"application/json","X-CMC_PRO_API_KEY":"841ddc60-f64c-432c-a79f-8087f804b8d9"}
//   );
//     // String url = "https://api.coinranking.com/v1/public/coins";
//     // http.Response res = await http.get(url);
//     var decoded = jsonDecode(response.body);
//     var currencies = Cryptocurrencies.fromJson(decoded);
//     print(currencies.data.coins.length);
//     setState(() {});
//   }
