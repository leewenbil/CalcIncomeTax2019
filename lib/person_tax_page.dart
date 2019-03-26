import 'package:flutter/material.dart';
import 'package:flutter_app/calc_utils.dart';
import 'person_settings.dart';

class PersonTax extends StatefulWidget {
  @override
  createState() => new PersonTaxState();
}

class PersonTaxState extends State<PersonTax> {
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  var taxUtils = CalcUtils();

  var taxResults = List<List<double>>();

  @override
  Widget build(BuildContext context) {
    print(taxResults);
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Income Tax'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushToSettingsPage),
        ],
      ),
      body: _buildResultList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _reCalc,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buildResultList() {
    var size = taxResults.length;
    size = size < 12 ? 0 : 13;
    print(size);
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: size,
      itemBuilder: (context, i) {
        if (i == 0) {
          return _buildTotalRow();
        } else {
          return _buildRow(taxResults[i - 1], i);
        }
      },
    );
  }

  Widget _buildTotalRow() {
    var totalIncome = (CalcUtils.settingsData.income * 12).toStringAsFixed(2);
    var totalAfterTax = taxResults[11][3].toStringAsFixed(2);
    return Card(
      child: ListTile(
        title: Text(
          "税前总计: " + totalIncome + ", 到手: " + totalAfterTax,
          style: _biggerFont,
        ),
        subtitle: Text(
          "个税总计：" + taxResults[11][2].toStringAsFixed(2),
        ),
      ),
    );
  }

  Widget _buildRow(taxItem, i) {
    return Card(
      child: ListTile(
        title: Text(
          "税后:" + taxItem[1].toStringAsFixed(2),
          style: _biggerFont,
        ),
        subtitle: Text(
          "个税:" + taxItem[0].toStringAsFixed(2),
        ),
        trailing: Text(
          (i).toString() + "月",
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  void _pushToSettingsPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PersonSettings();
    }));
  }

  void _reCalc() {
    var calcUtils = CalcUtils();
    calcUtils.calc();
    setState(() {
      taxResults = CalcUtils.results;
    });
  }
}
