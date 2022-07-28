import 'package:city_max/paymentdetails/confrimpayment.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

import '../services/geo_locator.dart';

class NextDetailPage extends StatefulWidget {
  String title, subTitle, serviceHours, heros, price;
  var snap;
  var products;

  NextDetailPage({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.serviceHours,
    required this.heros,
    required this.price,
    this.snap,
    this.products,
  }) : super(key: key);

  @override
  State<NextDetailPage> createState() => _NextDetailPageState();
}

class _NextDetailPageState extends State<NextDetailPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _addrController = TextEditingController();
  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  @override
  void initState() {
    debugPrint(widget.products.toString());
    _timeController.text = formatTimeOfDay(TimeOfDay.now());
    getAddress();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _descController.dispose();
    _addrController.dispose();
    super.dispose();
  }

  void getAddress() async {
    await getLocation()
        .getCurrentLocation(true)
        .then((value) => _addrController.text = value);
    setState(() {
      _addrController.text;
    });
    // _addressController.text = _address.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Date and Time'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: ListTile(
                    title:
                        const Text('What date would you like your services?'),
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
                    title:
                        const Text('What time would you like your services?'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'Hero will arrived within selected time range.'),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            // child: TextField(
                            //   controller: _timeController,
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: 'Time',
                            //   ),
                            // ),
                            child: AbsorbPointer(
                              child: TextField(
                                controller: _timeController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.av_timer),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: ListTile(
                      title: Text('Service Description'),
                      subtitle: TextField(
                        controller: _descController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description',
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: ListTile(
                    title: Text('Address'),
                    subtitle: TextField(
                      controller: _addrController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address',
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.pin_drop,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
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
                          desc: _descController.text,
                          heros: widget.heros,
                          loc: _addrController.text,
                          serviceHours: widget.serviceHours,
                          // time: _valueSaved4,
                          time: _timeController.text,
                          title: widget.title,
                          subTitle: widget.subTitle,
                          price: widget.price,
                          snap: widget.snap,
                          products: widget.products,
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
      ),
    );
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      var time = formatTimeOfDay(timeOfDay);
      debugPrint(time.toString());
      setState(() {
        _timeController.text = time.toString();
        selectedTime = timeOfDay;
      });
    }
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
