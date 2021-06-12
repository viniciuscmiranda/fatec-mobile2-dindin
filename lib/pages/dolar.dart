import 'package:dindin/models/currency.dart';
import 'package:dindin/widgets/currency_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DolarPage extends StatefulWidget {
  const DolarPage({this.currency});

  final Currency currency;

  @override
  _DolarPageState createState() => _DolarPageState();
}

class _DolarPageState extends State<DolarPage> {
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
          FontAwesomeIcons.dollarSign,
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
