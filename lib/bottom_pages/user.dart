// import 'package:college_meet/BottomNavigatonBar/Screens/Edit%20User/edit_User.dart'
import 'package:city_max/bottom_pages/noti.dart';
import 'package:city_max/paymentdetails/add_card.dart';
import 'package:city_max/phoneAuthentication/phoneauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);
  zisttile(String text, IconData icon, VoidCallback function) {
    return ListTile(
      onTap: function,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/splash.png'),
              SizedBox(
                height: 50,
              ),
              zisttile('Notification', Icons.notifications, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Notifications()));
              }),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
              ),
              zisttile('Security', Icons.lock, () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => Invite_Friends()));
              }),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
              ),
              zisttile('About Us', Icons.payment, () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (builder) => AddCard()));
              }),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
              ),
              zisttile('Logout', Icons.login_outlined, () async {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => PhoneAuth()),
                        (route) => false));
              })
            ],
          ),
        ),
      ),
    );
  }
}
