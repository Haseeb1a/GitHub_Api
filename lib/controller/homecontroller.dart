import 'package:flutter/material.dart';

import '../model/githubmodel.dart';
import '../services/gitservices.dart';

class Homecontroller extends ChangeNotifier {

  String searched = "hudaifc";
    final TextEditingController searchcontroller = TextEditingController();
     clearsearch() {
      searchcontroller.clear();
    }
    
  
}
