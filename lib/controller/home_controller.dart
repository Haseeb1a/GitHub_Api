import 'package:flutter/material.dart';

class Homecontroller with ChangeNotifier {
    String? searched ="ansadmk";
    final TextEditingController searchcontroller = TextEditingController();
    clearsearch() {
      searchcontroller.clear();
    }
}