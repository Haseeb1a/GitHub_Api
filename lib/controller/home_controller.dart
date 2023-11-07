import 'package:flutter/material.dart';

class Homecontroller with ChangeNotifier {
    String searched = "kpmajid";
    final TextEditingController searchcontroller = TextEditingController();
    clearsearch() {
      searchcontroller.clear();
    }
}