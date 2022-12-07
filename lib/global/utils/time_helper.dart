import 'package:intl/intl.dart';

String unixTimeToKkTime(int time) {
  var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  // final DateFormat formatter = DateFormat('y/M/d HH:mm');
  // formatter.format(date);
  String formattedDate = DateFormat('dd/MM/yyyy kk:mm').format(date);
  return formattedDate;
}
