import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/color_constant.dart';

class Utils {
  static showToast(String message, {bool isBottom = true}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstant.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static dateFormatUtil(String date) {
    final splitted = date.split(':');

    return splitted[0] + ":" + splitted[1];
  }

  static dateFormatUtilMonth(String date) {
    String month = "";

    final splitted = date.split('-');

    if (splitted[1] == "01") {
      month = "Jan";
    } else if (splitted[1] == "02") {
      month = "Feb";
    } else if (splitted[1] == "03") {
      month = "Mar";
    } else if (splitted[1] == "04") {
      month = "Apr";
    } else if (splitted[1] == "05") {
      month = "May";
    } else if (splitted[1] == "06") {
      month = "Jun";
    } else if (splitted[1] == "07") {
      month = "Jul";
    } else if (splitted[1] == "08") {
      month = "Aug";
    } else if (splitted[1] == "09") {
      month = "Sep";
    } else if (splitted[1] == "10") {
      month = "Oct";
    } else if (splitted[1] == "11") {
      month = "Nov";
    } else if (splitted[1] == "12") {
      month = "Dec";
    }
    var newString = splitted[0].substring(splitted[0].length - 2);

    return splitted[2] + "-" + month + "-" + newString;
  }

  static dateFormatUtilMonth2(String date) {
    String month = "";

    final splitted = date.split('-');

    if (splitted[1] == "01") {
      month = "Jan";
    } else if (splitted[1] == "02") {
      month = "Feb";
    } else if (splitted[1] == "03") {
      month = "Mar";
    } else if (splitted[1] == "04") {
      month = "Apr";
    } else if (splitted[1] == "05") {
      month = "May";
    } else if (splitted[1] == "06") {
      month = "Jun";
    } else if (splitted[1] == "07") {
      month = "Jul";
    } else if (splitted[1] == "08") {
      month = "Aug";
    } else if (splitted[1] == "09") {
      month = "Sep";
    } else if (splitted[1] == "10") {
      month = "Oct";
    } else if (splitted[1] == "11") {
      month = "Nov";
    } else if (splitted[1] == "12") {
      month = "Dec";
    }

    return splitted[2] + " " + month + " " + splitted[0];
  }
}
