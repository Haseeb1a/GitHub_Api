import 'dart:js';

import 'package:flutter/material.dart';
import 'package:github/controller/profilepage.dart';
import 'package:provider/provider.dart';

import '../model/githubmodel.dart';
import '../services/gitservices.dart';

class Homecontroller extends ChangeNotifier {
  String searched = "hudaifc";
  final TextEditingController searchcontroller = TextEditingController();
  clearsearch() {
    searchcontroller.clear();
  }


}
