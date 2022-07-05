import 'package:city_max/paymentdetails/confrimpayment.dart';
import 'package:flutter/material.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';


class NextDetailPage extends StatefulWidget {
  const NextDetailPage({Key? key}) : super(key: key);

  @override
  State<NextDetailPage> createState() => _NextDetailPageState();
}

class _NextDetailPageState extends State<NextDetailPage> {
  var _selectedValue;
    String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
       
   Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text('Select Date'),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalenderPicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
            ),
          ),
        ),

         Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text('Select Time'),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child:DateTimePicker(
                type: DateTimePickerType.time,
                //timePickerEntryModeInput: true,
                //controller: _controller4,
                initialValue: '', //_initialValue,
                icon: Icon(Icons.access_time),
                timeLabelText: "Time",
                use24HourFormat: false,
                locale: Locale('pt', 'BR'),
                onChanged: (val) => setState(() => _valueChanged4 = val),
                validator: (val) {
                  setState(() => _valueToValidate4 = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
              ),
              ),
            ),
          ),
        ),
        Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 60),
                shape: StadiumBorder()
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => ConfrimPayment()));
              },
              child: const Text('Proceed And Pay'),
            ),
       ),
          ],
        ),
      ),
    );
  }
}