import 'package:dindin/models/currency.dart';
import 'package:dindin/widgets/currency_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BitCoinPage extends StatefulWidget {
  const BitCoinPage({this.currency});

  final Currency currency;

  @override
  _BitCoinPageState createState() => _BitCoinPageState();
}

class _BitCoinPageState extends State<BitCoinPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
        ),
        Icon(
          FontAwesomeIcons.btc,
          size: 200,
          color: Colors.amberAccent.shade200,
        ),
        SizedBox(
          height: 32,
        ),
        CurrencyView(widget.currency),
        SizedBox(
          width: double.infinity,
        ),
      ],
    );
  }
}
