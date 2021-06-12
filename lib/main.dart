import 'dart:ui';

import 'package:dindin/pages/bitcoin.dart';
import 'package:dindin/pages/dolar.dart';
import 'package:dindin/pages/euro.dart';
import 'package:dindin/pages/query.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:dindin/helpers/price.dart';
import 'package:dindin/models/currency.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color(0xFF171717),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
      home: MyHomePage(title: 'Din Din App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var helper = PriceHelper();
  var currencies;
  String bitCoin = "BitCoin";

  var _selectedIndex = 0;
  var pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: helper.getCurrencyPrice(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballScaleMultiple,
                  color: Colors.amberAccent,
                ),
              ),
            );
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.exclamationTriangle,
                  color: Colors.amberAccent,
                  size: 75,
                ),
                Text('${snapshot.error.toString()}'),
              ],
            );
          } else {
            var data = snapshot.data;
            var coins = [
              Currency.fromJson(data['USD']),
              Currency.fromJson(data['EUR']),
              Currency.fromJson(data['BTC'])
            ];
            pages = [
              DolarPage(currency: coins[0]),
              EuroPage(currency: coins[1]),
              BitCoinPage(currency: coins[2]),
              QueryPage(currencies: coins),
            ];
            return pages[_selectedIndex];
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dollarSign), label: 'Dolar'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.euroSign), label: 'Euro'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.btc), label: 'BTC'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.searchDollar), label: 'Query'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
