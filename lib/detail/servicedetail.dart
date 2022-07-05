import 'package:city_max/detail/nextdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({Key? key}) : super(key: key);

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text('Cleaning'),
                  subtitle: Text('House Keeping Without Materials'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text('How many hours of service you need'),
                  subtitle: TextField(
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
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                    title: Text('Address'),
                    subtitle: Text('Enable Location',style: TextStyle(color: Colors.blue),),
                    trailing: IconButton(icon: Icon(Icons.pin_drop,color: Colors.blue,),onPressed: (){},),
                    ),
                    
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                    title: Text('Offers'),
                    subtitle:Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                    
                      CustomCheckBoxGroup<String>(
                        // scrollController: ScrollController(),
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
                    
                    
          ])       ,
          trailing: Icon(Icons.info),
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
                Navigator.push(context, MaterialPageRoute(builder: (builder) => NextDetailPage()));
              },
              child: const Text('Next'),
            ),
       ),
      ])),
    );
  }
}
