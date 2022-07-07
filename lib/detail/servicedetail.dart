import 'package:city_max/detail/nextdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class ServiceDetail extends StatefulWidget {
  String title, subTitle, price;
  ServiceDetail({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
  }) : super(key: key);

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  TextEditingController _hoursController = TextEditingController();
  TextEditingController _herosController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  @override
  void dispose() {
    _hoursController.dispose();
    _herosController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text(widget.title.toString()),
              subtitle: Text(widget.subTitle.toString()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text('How many hours of service you need'),
              subtitle: TextField(
                controller: _hoursController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Service Hours',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text('How many heros you need'),
              subtitle: TextField(
                controller: _herosController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Heros',
                ),
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
              subtitle: Text(
                'Enable Location',
                style: TextStyle(color: Colors.blue),
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
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text('Offers'),
              subtitle: Row(children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      CustomCheckBoxGroup<String>(
                        // scrollController: ScrollController()
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: [
                          "Weekly 15% Off ",
                          "Bi-Weekly 5% Off",
                          "One Time",
                        ],
                        buttonValuesList: [
                          "Weekly 15% OfF ",
                          "Bi-Weekly",
                          "One Time",
                        ],
                        checkBoxButtonValues: (values) {
                          print(values);
                        },
                        defaultSelected: ["Weekly"],
                        horizontal: true,
                        width: 120,
                        // hight: 50,
                        selectedColor: Theme.of(context).colorScheme.secondary,
                        padding: 5,
                        spacing: 0.0,
                        // enableShape: true,
                      ),
                    ],
                  ),
                ),
              ]),
              trailing: Icon(Icons.info),
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
                  builder: (builder) => NextDetailPage(
                    desc: _descController.text,
                    heros: _herosController.text,
                    loc: '',
                    serviceHours: _hoursController.text,
                    subTitle: widget.subTitle,
                    title: widget.title,
                    price: widget.price,
                  ),
                ),
              );
            },
            child: const Text('Next'),
          ),
        ),
      ])),
    );
  }
}
