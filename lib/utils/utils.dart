import 'package:flutter_favor_app/data/data.dart';
import 'package:intl/intl.dart';

class Utils {
  static generateNames() {
    return names;
  }

  static formatDate(DateTime date) {
    var format = DateFormat("dd-MM-yyyy").format(date);
    return format.toString();
  }


  static formatHour(DateTime date) {
    var format = DateFormat("HH:mm").format(date);
    return format.toString();
  }
}
