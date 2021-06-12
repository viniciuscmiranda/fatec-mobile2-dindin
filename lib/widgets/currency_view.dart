import 'package:dindin/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView(this.currency);

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: '\$',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: ' - ${currency.name}',
                style: TextStyle(color: Colors.amberAccent, fontSize: 18),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Venda ',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: ' - R\$ ${currency.sell}',
                style: TextStyle(color: Colors.amberAccent, fontSize: 18),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Compra ',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: ' - R\$ ${currency.buy}',
                style: TextStyle(color: Colors.amberAccent, fontSize: 18),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Variação ',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: ' - R\$ ${currency.variation}',
                style: TextStyle(color: Colors.amberAccent, fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
