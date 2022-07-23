//Profile DataBase Storage
import 'dart:typed_data';

import 'package:city_max/firebasedb/storage_methods.dart';
import 'package:city_max/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../providers/cart.dart';

class DatabaseMethods {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //Profile Details
  Future<String> profileDetail(
      {required String email,
      required String uid,
      required String fullName,
      required String dob,
      required String phoneNumber,
      required String gender,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || fullName.isNotEmpty || phoneNumber.isNotEmpty) {
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal
        ProfileModel userModel = ProfileModel(
            gender: gender,
            fullName: fullName,
            uid: FirebaseAuth.instance.currentUser!.uid,
            email: email,
            dob: dob,
            phoneNumber: phoneNumber,
            photoURL: photoURL);
        await firebaseFirestore
            .collection('users')
            .doc(uid)
            .set(userModel.toJson());
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> addOrder({
    required List products,
    required String serviceHours,
    required String heros,
    required String desc,
    required String loc,
    required String date,
    required String time,
    required double price,
    required bool paid,
  }) async {
    String res = 'Some error occured';
    debugPrint(res);

    String uuid = Uuid().v1();
    try {
      await firebaseFirestore.collection('orders').doc(uuid).set({
        'products': products,
        'serviceHours': serviceHours,
        'heros': heros,
        'userDescription': desc,
        'loc': loc,
        'date': date,
        'time': time,
        'price': price,
        'status': 'pending',
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'uuid': uuid,
      });
      res = 'sucess';
      debugPrint(res);
    } on FirebaseException catch (e) {
      res = e.toString();
      debugPrint(res);
    }
    return res;
  }
}
