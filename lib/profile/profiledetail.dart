import 'dart:io';
import 'dart:typed_data';
import 'package:city_max/firebasedb/firebasedb.dart';
import 'package:city_max/main/mainscreen.dart';
import 'package:city_max/utils/utils.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  var gender = ['Male', 'Female', 'Others'];

  String dropdownvalue = 'Male';
  
  var timestamp;

//Text Field Title
  _titleText(String s) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(top: 20),
      child: Text(
        s,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff18191A),
            fontStyle: FontStyle.normal),
      ),
    );
  }


//TextFieldws
  Widget _textFormFieldFunctionIcon(
    TextEditingController controller,
    String? Function(String?)? validator,
    String Active,
  ) {
    var inputDecoration = InputDecoration(
        border: InputBorder.none,
        hintText: Active,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        contentPadding: EdgeInsets.only(top: 10, left: 10),
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ));
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: TextFormField(
        enabled: controller.text.isNotEmpty ? false : true,
        controller: controller,
        validator: validator,
        autocorrect: true,
        decoration: inputDecoration,
      ),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
    Uint8List ? _image;


 //Looding Variable
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    nameController.clear();
    phoneController.clear();
    dobController.clear();
  }


  final ImagePicker _picker = ImagePicker();
  File? imageUrl;
  String imageLink = "";
  void getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                      child: Text(
                    'Profile Details',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ))),
              Center(
                child: Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 59, backgroundImage: MemoryImage(_image!))
                          : Image.asset(
                                  'assets/profile.png',height: 100,width: 200,),
                            
                      Positioned(
                          bottom: -10,
                          left: 70,
                          child: IconButton(
                              onPressed: () => selectImage(),
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              )))
                    ],
                  ),
              ),
              _titleText('Full Name'),
              _textFormFieldFunctionIcon(
                  nameController, (p0) => null, "Mathawe Wilson"),
                   _titleText('Email'),
              _textFormFieldFunctionIcon(
                  emailController, (p0) => null, "Email"),
              _titleText('Date of Birth'),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: DateTimePicker(
                  controller: dobController,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
              ),
              _titleText('Gender'),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: dropdownvalue,
                    items: gender.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        value = dropdownvalue;
                      });
                    },
                  ),
                ),
              ),
      
                _titleText('Phone Number'),
              _textFormFieldFunctionIcon(
                  phoneController, (p0) => null, "Phone Number"),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blueAccent,
                      primary: Colors.blue,
                      fixedSize: Size(300, 55),
                    ),
                    onPressed: profile,
                    child: _isLoading ? CircularProgressIndicator() : Text(
                      'Next ',
                      style: GoogleFonts.getFont('Roboto',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
 /// Select Image From Gallery
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

   ///ProfileDetails
  profile() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await DatabaseMethods().profileDetail(
        email: emailController.text,
        fullName: nameController.text,
        dob: dobController.text,
        phoneNumber: phoneController.text,
        file: _image!, gender: dropdownvalue, uid: FirebaseAuth.instance.currentUser!.uid);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (builder) => MainScreen()));
    }
  
}
}
