import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
    final TextEditingController _cardusernameController = TextEditingController();

  final TextEditingController _holderController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ccvController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                    'Add new card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
               
                Container(
                                      margin: EdgeInsets.only(left: 30, right: 30, top: 10),

                  child: Text('Card Number',style: 
                  TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff8D8989),
                              fontSize: 10,
                            
                              fontStyle: FontStyle.normal),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                    height: 55,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),

                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      controller: _cardusernameController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "3213 0412 0515 1131";
                        }

                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        
                        hintText: '3213 0412 0515 1131.',
                        contentPadding: EdgeInsets.only(top: 15, left: 20,right: 20),
                        border: InputBorder.none,
                        
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8D8989),
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
                     Container(
                                      margin: EdgeInsets.only(left: 30, right: 30, top: 20),

                  child: Text("Cardholder's Name",style: 
                  TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff8D8989),
                              fontSize: 10,
                              fontStyle: FontStyle.normal),
                  
                  ),
                ),
                Container(
                    height: 55,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),

                    //  padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: new BorderRadius.circular(20),
                    ),
                    // border: Border.all(color: Colors.grey,width: 0.5)

                    child: TextFormField(
                      //  textAlign: TextAlign.start,
                      controller: _holderController,
                      validator: (v) {
                        if (v!.isEmpty || !v.contains("abcdefghijklmnopqrstuvwxyz")) {
                          return " Enter valid name ";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: ' Chirs Brown',
                        contentPadding: EdgeInsets.only(top: 10, left: 20),
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8D8989),
                            fontSize: 12,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
                     Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                                            margin: EdgeInsets.only(left: 30, right: 30,),

                  child: Text('Expires On',style: 
                  TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff8D8989),
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal),
                  
                  ),
                ),
                 Container(
                                            margin: EdgeInsets.only(right: 40, top: 10),

                  child: Text('CVC',style: 
                  TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff8D8989),
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal),
                  
                  ),
                ),
                         ],
                       ),
                     ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          height: 55,
                          margin: EdgeInsets.only(left: 20,),

                          //  padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                      color: Colors.white70,
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          // border: Border.all(color: Colors.grey,width: 0.5)

                          child: TextFormField(
                            controller: _dateController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return " Please Enter Valid Date..  ";
                              }

                              return null;
                            },
                            obscureText: true,
                            //  textAlign: TextAlign.start,
                            decoration: InputDecoration(
                            
                              hintText: ' 12/12/12',
                              contentPadding: EdgeInsets.only(top: 10, left: 10),
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal),
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff8D8989),
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal),
                            ),
                          )),
                    ),
                    SizedBox(width: 10,),
                     Expanded(
                      child: Container(
                          height: 55,
                          margin: EdgeInsets.only(right: 30,),

                          //  padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                      color: Colors.white70,
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          // border: Border.all(color: Colors.grey,width: 0.5)

                          child: TextFormField(
                            controller: _ccvController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return " Please Enter Valid CVC..  ";
                              }

                              return null;
                            },
                            obscureText: true,
                            //  textAlign: TextAlign.start,
                            decoration: InputDecoration(
                            
                              hintText: '345',
                              contentPadding: EdgeInsets.only(left: 10,top: 10),
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal),
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff8D8989),
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal),
                            ),
                          )),
                    ),
                  ],
                ),
               
                SizedBox(
                  height: 40,
                ),
                 Center(
                   child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:  Colors.blue,
                        fixedSize: const Size(310, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                      onPressed: (){},
                      //  () {
                      //   print('this is name controller $_usernameController');

                      //   print('this is name controller $_emailController');

                      //   print('this is name controller $_passwordController');

                      //   print('this is name controller $_refreralController');

                      //   if (formKey.currentState!.validate()) ;

                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                      // },
                      child: Text(
                              'Add',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            ),
                    
                ),
                 ),
               
              ],
            ),
          ),
        
      
    
      );
  }
}