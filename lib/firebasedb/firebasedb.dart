//Profile DataBase Storage
import 'dart:typed_data';

import 'package:city_max/firebasedb/storage_methods.dart';
import 'package:city_max/models/profile_model.dart';
import 'package:city_max/services/send_email.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../providers/cart.dart';
import '../utils/utils.dart';

class DatabaseMethods {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//OTP Number Add
  Future<String> numberAdd() async {
    String res = 'Some error occured';
    try {
      //Add User to the database with modal
      ProfileModel userModel = ProfileModel(
        gender: '',
        fullName: '',
        uid: FirebaseAuth.instance.currentUser!.uid,
        email: '',
        dob: '',
        phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
        // photoURL: '',
      );
      await firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
            userModel.toJson(),
          );
      res = 'success';
      debugPrint(res);
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Profile Details
  Future<String> profileDetail({
    required String email,
    required String uid,
    required String fullName,
    required String dob,
    required String gender,
    // required Uint8List file,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || fullName.isNotEmpty) {
        // String photoURL = await StorageMethods()
        //     .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal

        ProfileModel userModel = ProfileModel(
          gender: gender,
          fullName: fullName,
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: email,
          dob: dob,
          phoneNumber:
              FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
          // photoURL: photoURL,
        );
        await firebaseFirestore
            .collection('users')
            .doc(uid)
            .update(userModel.toJson());
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
    required String payVia,
    required int price,
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
        'payVia': payVia,
        'review': '',
      });
      res = 'sucess';

      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      // String emailStat = await SendEmail().sendEmail(
      //   email: userSnap.data()!['email'],
      //   name: userSnap.data()!['fullName'],
      //   subject: 'New Order!',
      //   message:
      //       'Order id: $uuid, \n Customer id: ${userSnap.data()!['uid']}, \n Customer number: ${userSnap.data()!['phoneNumber']}',
      // );

      // debugPrint(emailStat);

      try {
        await Utils.sendEmail(
          body:
              'Order id: $uuid, \n Customer id: ${userSnap.data()!['uid']}, \n Customer number: ${userSnap.data()!['phoneNumber']}',
          email: "citymax718@gmail.com",
          subject: "New Order!",
        );
      } catch (e) {
        debugPrint("sendEmail failed ${e}");
      }

      debugPrint(res);
    } on FirebaseException catch (e) {
      res = e.toString();
      debugPrint(res);
    }
    return res;
  }

  Future<String> deleteOrder({required orderId}) async {
    String res = 'Some error occured';
    debugPrint(res);

    try {
      await firebaseFirestore.collection('orders').doc(orderId).delete();
      res = 'sucess';
      debugPrint(res);
    } on FirebaseException catch (e) {
      res = e.toString();
      debugPrint(res);
    }
    return res;
  }

  Future<String> reviewOrder({
    required orderId,
    required String review,
  }) async {
    String res = 'Some error occured';
    debugPrint(res);

    try {
      await firebaseFirestore.collection('orders').doc(orderId).update({
        'review': review,
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
