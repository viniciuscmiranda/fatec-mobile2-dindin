import 'package:dindin/models/currency.dart';
import 'package:dindin/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({Key key, this.currencies}) : super(key: key);
  final List<Currency> currencies;

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController bitcoinController = TextEditingController();

  _converterReal(String quantiaEmReais) {
    var reais = double.parse(quantiaEmReais);
    dollarController.text =
        (reais / widget.currencies[0].buy).toStringAsFixed(2);
    euroController.text = (reais / widget.currencies[1].buy).toStringAsFixed(2);
    bitcoinController.text =
        (reais / widget.currencies[2].buy).toStringAsFixed(2);
  }

  _converterDolar(String quantiaEmDolares) {
    var dolares = double.parse(quantiaEmDolares) * widget.currencies[0].buy;
    realController.text = (dolares).toStringAsFixed(2);
    euroController.text =
        (dolares / widget.currencies[1].buy).toStringAsFixed(2);
    bitcoinController.text =
        (dolares / widget.currencies[2].buy).toStringAsFixed(2);
  }

  _converterEuro(String quantiaEmEuros) {
    print(widget.currencies);

    var euros = double.parse(quantiaEmEuros) * widget.currencies[1].buy;
    realController.text = (euros).toStringAsFixed(2);
    dollarController.text =
        (euros / widget.currencies[0].buy).toStringAsFixed(2);
    bitcoinController.text =
        (euros / widget.currencies[2].buy).toStringAsFixed(2);
  }

  _converterBitCoin(String quantiaEmBitCoins) {
    print(widget.currencies);

    var bitCoins = double.parse(quantiaEmBitCoins) * widget.currencies[2].buy;
    realController.text = (bitCoins).toStringAsFixed(2);
    dollarController.text =
        (bitCoins / widget.currencies[0].buy).toStringAsFixed(2);
    euroController.text =
        (bitCoins / widget.currencies[1].buy).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Icon(FontAwesomeIcons.searchDollar, color: Colors.amber, size: 100),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            callback: (value) {
              _converterReal(value);
            },
            icon: FontAwesomeIcons.commentDollar,
            hint: 'Valor em Reais',
            enabled: true,
            controller: realController,
          ),
          CustomTextField(
            callback: (value) {
              _converterDolar(value);
            },
            enabled: true,
            icon: FontAwesomeIcons.dollarSign,
            hint: 'Valor em Dolar',
            controller: dollarController,
          ),
          CustomTextField(
            callback: (value) {
              _converterEuro(value);
            },
            enabled: true,
            icon: FontAwesomeIcons.euroSign,
            hint: 'Valor em Euro',
            controller: euroController,
          ),
          CustomTextField(
            callback: (value) {
              _converterBitCoin(value);
            },
            enabled: true,
            icon: FontAwesomeIcons.bitcoin,
            hint: 'Valor em BitCoin',
            controller: bitcoinController,
          ),
        ],
      ),
    );
  }
}
