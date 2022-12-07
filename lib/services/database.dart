import 'package:firebase_database/firebase_database.dart';

class Database {
  void insertData(){
    DatabaseReference ref = FirebaseDatabase.instance.ref();
  }

  void readData(){
    DatabaseReference ref = FirebaseDatabase.instance.ref('tbUsers');
  }

}