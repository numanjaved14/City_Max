import 'package:flutter/material.dart';

class ApointmentDetailsWidget extends StatelessWidget {
  var snap;
  ApointmentDetailsWidget({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Text(
              'Service Type: ${snap['serviceType']}',
            ),
            Text(
              'Service Category: ${snap['serviceCategory']}',
            ),
            Text(
              'Service Sub Category: ${snap['seriveSubCat']}',
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Text(
              'Quantity: ${snap['quantity']}',
            ),
            Text(
              'Price: ${snap['price']}',
            ),
          ],
        ),
      ),
    );
  }
}
