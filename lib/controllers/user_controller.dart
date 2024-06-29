import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/services/user_firebase_servises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends ChangeNotifier {
  final _userFirebaseServices = UserFirebaseServises();

  Stream<QuerySnapshot> get list {
    
    return _userFirebaseServices.getUser();
  }

  correctAnsver() {}
}
