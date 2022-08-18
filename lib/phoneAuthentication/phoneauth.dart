import 'package:city_max/main/mainscreen.dart';
import 'package:city_max/phoneAuthentication/ot.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final formKey=GlobalKey<FormState>();

  String dialCodeDigits = "+92";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                                Image.asset(
                        'assets/splash.png',
                        height: 100,
                        width: 200,
                      ),
                      SizedBox(height: 40,),
           Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueAccent
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child:
                         Row(
                          children: [
                            CountryCodePicker(
                                onChanged: (country) {
                                  setState(() {
                                    dialCodeDigits = country.dialCode!;
                                  });
                                },
                                initialSelection: "PK",
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                favorite: ["+92", "PAK"]),
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  validator: RequiredValidator(errorText: "Required"),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "3070684743",
                                    //  prefix: Padding(padding: EdgeInsets.all(10),child: Text(dialCodeDigits,style: TextStyle(color: Colors.black),),),
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: _controller,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
             if(formKey.currentState!.validate()){
               Navigator.push(context, MaterialPageRoute(builder: (builder) =>Ot(
                phone:_controller.text,
                codeDigits: dialCodeDigits
              )));

             }
            }, child: Text('Next'),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              shadowColor: Colors.black,
              fixedSize: Size(300, 60)
            ),
            
            ),

            SizedBox(height: 30,),
            Text('OR'),

                        SizedBox(height: 30,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => MainScreen()));
                        }, child: Text("Let's Explore App without signing",style: TextStyle(color: Colors.blue),))

          ],
        ),
      ),
    );
  }
}