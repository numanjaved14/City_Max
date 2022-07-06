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
                        height: 200,
                      ),
           Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
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
            ElevatedButton(onPressed: (){
             if(formKey.currentState!.validate()){
               Navigator.push(context, MaterialPageRoute(builder: (builder) =>Ot(
                phone:_controller.text,
                codeDigits: dialCodeDigits
              )));
             }
            }, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}