import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/services/user_firebase_servises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends ChangeNotifier {
  final _userFirebaseServices = UserFirebaseServises();
  final List _listUsers = [];
  final List<Map<String, dynamic>> _topList = [];
  int willRun = 0;
  Stream<QuerySnapshot> get list {
    return _userFirebaseServices.getUser();
  }

  allUsers(List users) {
    for (int i = 0; i < users.length; i++) {
      _listUsers.add(users[i].id);
    }
    // sortTop(users);
  }

  sortTopLenght() {
    return _topList.length;
  }

  sortTop(List users) {
    if (willRun == 0) {
      for (int i = 0; i < users.length; i++) {
        _topList.add(
          {
            "name": users[i]["name"],
            "currectAnswers": users[i]["currectAnswers"]
          },
        );
      }
    }
    willRun++;
    _topList.sort(
      (a, b) => b["currectAnswers"].compareTo(
        a["currectAnswers"],
      ),
    );

    return _topList;
  }
}
