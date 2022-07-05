import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Notifications'),
      ),
      body: ListView.builder(
                  
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                       
                        ListTile(
                         
                        
                            title: Text("Service will completed"),),
                            Divider()
                      ],
                    );
                        
                  }),
    );
  }
}