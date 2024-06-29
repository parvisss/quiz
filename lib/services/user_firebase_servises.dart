import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirebaseServises {
  final _userCollection = FirebaseFirestore.instance.collection("users");
  Stream<QuerySnapshot> getUser() async* {
    yield* _userCollection.snapshots();
  }
  // correctAnsver(){
  //   _userCollection.snapshots().
  // }
}
