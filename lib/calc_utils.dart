import 'package:flutter_app/settings_data.dart';

const YEAR_LEVELS = [-1, 36000, 144000, 300000, 420000, 660000, 960000];
const TAX_RATES = [0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45];
const SUBTRACT_PARAMS = [0, 2520, 16920, 31920, 52920, 85920, 181920];

class CalcUtils {
  static final settingsData = SettingsData();
  // 存放12个月的情况
  static final results = List<List<double>>(12);
  static var hasInit = false;
  static CalcUtils _instance;

  factory CalcUtils() {
    if (_instance == null) {
      _instance = CalcUtils._internal();
    }
    return _instance;
  }

  CalcUtils._internal() {
    for (var i = 0; i < 12; i++) {
      results[i] = [0, 0, 0, 0];
    }
  }

  void calc() {
    final eachMonthBase = settingsData.income - settingsData.fiveInsAndOneGold;
    final eachMonthCal = eachMonthBase - settingsData.specialDed - 5000;

    if (eachMonthCal < 0) {
      return;
    }

    var totalDeduction = 0.0;
    var totalAfterTax = 0.0;
    var index = 1;
    results.forEach((item) {
      var sum = eachMonthCal * index;
      var level = _findLevel(sum);
      var deduction =
          sum * TAX_RATES[level] - SUBTRACT_PARAMS[level] - totalDeduction;
      totalDeduction += deduction;
      item[0] = deduction;
      item[1] = eachMonthBase - deduction;
      item[2] = totalDeduction;

      totalAfterTax += item[1];
      item[3] = totalAfterTax;

      index++;
    });
    print(results);
  }

  int _findLevel(sum) {
    print(sum);
    var size = YEAR_LEVELS.length;
    for (var i = 0; i < size; i++) {
      if (i == size - 1) {
        return i;
      } else if (sum > YEAR_LEVELS[i] && sum <= YEAR_LEVELS[i + 1]) {
        return i;
      }
    }
    return 0;
  }
}
