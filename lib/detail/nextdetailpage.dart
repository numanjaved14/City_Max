import 'package:city_max/paymentdetails/confrimpayment.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class NextDetailPage extends StatefulWidget {
  String title, subTitle, serviceHours, heros, desc, loc, price;
  var snap;

  NextDetailPage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.serviceHours,
    required this.heros,
    required this.desc,
    required this.loc,
    required this.price,
    this.snap,
  }) : super(key: key);

  @override
  State<NextDetailPage> createState() => _NextDetailPageState();
}

class _NextDetailPageState extends State<NextDetailPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  @override
  void initState() {
    debugPrint(widget.snap.toString());
    // TODO: implement initState
    super.initState();
  }

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
                  title: const Text('What date would you like your services?'),
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
                  title: const Text('What time would you like your services?'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'Hero will arrived within selected time range.'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: TextField(
                        //   controller: _timeController,
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     hintText: 'Time',
                        //   ),
                        // ),
                        child: DateTimePicker(
                          type: DateTimePickerType.time,
                          //timePickerEntryModeInput: true,
                          controller: _timeController,
                          // initialValue: '', //_initialValue,

                          icon: Icon(Icons.access_time),
                          timeLabelText: "Time",
                          use24HourFormat: true,
                          locale: Locale('pt', 'BR'),
                          onChanged: (val) =>
                              setState(() => _valueChanged4 = val),
                          validator: (val) {
                            setState(() => _valueToValidate4 = val ?? '');
                            return null;
                          },
                          onSaved: (val) =>
                              setState(() => _valueSaved4 = val ?? ''),
                        ),
                      ),
                    ],
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
                        // time: _valueSaved4,
                        time: _timeController.text,
                        title: widget.title,
                        subTitle: widget.subTitle,
                        price: widget.price,
                        snap: widget.snap,
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
