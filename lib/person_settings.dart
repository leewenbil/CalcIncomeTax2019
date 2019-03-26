import 'package:flutter/material.dart';
import 'calc_utils.dart';
import 'package:flutter/services.dart';

class PersonSettings extends StatefulWidget {
  @override
  createState() => PersonSettingsState();
}

class PersonSettingsState extends State<PersonSettings> {
  TextEditingController incomeController = TextEditingController(
      text: CalcUtils.hasInit ? CalcUtils.settingsData.income.toString() : '');

  TextEditingController fiveInsAndOneGoldController = TextEditingController(
      text: CalcUtils.hasInit
          ? CalcUtils.settingsData.fiveInsAndOneGold.toString()
          : '');

  TextEditingController specialDedController = TextEditingController(
      text: CalcUtils.hasInit
          ? CalcUtils.settingsData.specialDed.toString()
          : '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Settings'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      '税前工资:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextField(
                      controller: incomeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '输入税前工资',
                      ),
                      autofocus: true,
                    ),
                  ),
                ]),
          ),
          Card(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      '五险一金等费用:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextField(
                      controller: fiveInsAndOneGoldController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '输入五险一金等费用',
                      ),
                      autofocus: true,
                    ),
                  ),
                ]),
          ),
          Card(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      '专项附加扣除:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextField(
                      controller: specialDedController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '输入专项附加扣除',
                      ),
                      autofocus: true,
                    ),
                  ),
                ]),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: buildOnPressed,
        child: Icon(Icons.save),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  void buildOnPressed() {
    CalcUtils.settingsData.income = double.parse(incomeController.text);
    CalcUtils.settingsData.fiveInsAndOneGold =
        double.parse(fiveInsAndOneGoldController.text);
    CalcUtils.settingsData.specialDed = double.parse(specialDedController.text);
    CalcUtils.hasInit = true;
  }
}
