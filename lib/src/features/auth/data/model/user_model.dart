

import 'package:Goal/src/features/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity{

  UserModel({
    super.name,
    super.email,
    super.uid,
    super.status,
    super.profileUrl,
});


  factory UserModel.fromSnapshot(DocumentSnapshot snapshot){
    var snapshotMap = snapshot.data() as Map<String,dynamic>;

    return UserModel(
      name: snapshotMap['name'],
      profileUrl: snapshotMap['profileUrl'],
      status: snapshotMap['status'],
      uid: snapshotMap['uid'],
      email: snapshotMap['email']
    );
  }

  Map<String,dynamic> toDocument(){
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "status": status,
      "profileUrl": profileUrl,
    };
  }


}