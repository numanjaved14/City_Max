import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String uid;
  String email;
  String fullName;
  String dob;
  String gender;
  String phoneNumber;
  // String photoURL;

  ProfileModel({
    required this.uid,
    required this.gender,
    required this.email,
    required this.dob,
    // required this.photoURL,
    required this.fullName,
    required this.phoneNumber,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'uid': uid,
        'email': email,
        'dob': dob,
        'phoneNumber': phoneNumber,
        // 'photoURL': photoURL,
        'gender': gender
      };

  ///
  static ProfileModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ProfileModel(
      gender: snapshot['gender'],
      fullName: snapshot['fullName'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      // photoURL: snapshot['photoURL'],
      dob: snapshot['dob'],
      phoneNumber: snapshot['phoneNumber'],
    );
  }
}
