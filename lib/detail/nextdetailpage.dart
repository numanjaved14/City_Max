import 'package:city_max/paymentdetails/confrimpayment.dart';
import 'package:flutter/material.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';

class NextDetailPage extends StatefulWidget {
  String title, subTitle, serviceHours, heros, desc, loc, price;

  NextDetailPage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.serviceHours,
    required this.heros,
    required this.desc,
    required this.loc,
    required this.price,
  }) : super(key: key);

  @override
  State<NextDetailPage> createState() => _NextDetailPageState();
}

class _NextDetailPageState extends State<NextDetailPage> {
  TextEditingController _dateController = TextEditingController();
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
                    child: DateTimePicker(
                      type: DateTimePickerType.date,
                      dateMask: 'd MMM, yyyy',
                      controller: _dateController,
                      // initialValue: _date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      // dateLabelText: 'Date',
                      // timeLabelText: "Hour",
                      //use24HourFormat: false,
                      //locale: Locale('pt', 'BR'),
                      // selectableDayPredicate: (date) {
                      //   if (date.weekday == 6 || date.weekday == 7) {
                      //     return false;
                      //   }
                      //   return true;
                      // },
                      // onChanged: (val) => setState(() => _valueChanged1 = val),
                      validator: (val) {
                        // setState(() => _valueToValidate1 = val ?? '');
                        return null;
                      },
                      // onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                      ),
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
                    child: DateTimePicker(
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
                      onSaved: (val) =>
                          setState(() => _valueSaved4 = val ?? ''),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 60), shape: StadiumBorder()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => ConfrimPayment(
                        date: _dateController.text,
                        desc: widget.desc,
                        heros: widget.heros,
                        loc: widget.loc,
                        serviceHours: widget.serviceHours,
                        time: _valueSaved4,
                        title: widget.title,
                        subTitle: widget.subTitle,
                        price: widget.price,
                      ),
                    ),
                  );
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
