import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static TextStyle textfancyheader =
      GoogleFonts.poppins(fontSize: 25, color: Color.fromRGBO(254, 178, 1, 1));
  static TextStyle textfancyheader_two =
      GoogleFonts.poppins(fontSize: 18, color: Color.fromRGBO(254, 178, 1, 1));
  static TextStyle texterror = TextStyle(fontSize: 18, color: Colors.red[600]);
  static TextStyle textbody = TextStyle(fontSize: 18, color: Colors.black);
  static TextStyle textbodyfocus =
      TextStyle(fontSize: 22, color: const Color.fromARGB(255, 255, 233, 34));
  static TextStyle textbodywhite =
      TextStyle(fontSize: 22, color: Color.fromARGB(255, 255, 255, 255));
  static TextStyle textbodyfocuswhite =
      TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255));
  static TextStyle Textlink =
      TextStyle(fontSize: 13, color: Color.fromARGB(255, 255, 142, 67));
  static Color appbarcolor = Color.fromRGBO(232, 216, 0, 1);
  static Color appbarbackground = Color.fromRGBO(149, 139, 0, 1);
  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/MM/yy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      print("loi");
      return false;
    }
  }
}
