import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AboutCityMax extends StatefulWidget {
  const AboutCityMax({Key? key}) : super(key: key);

  @override
  State<AboutCityMax> createState() => _AboutCityMaxState();
}

class _AboutCityMaxState extends State<AboutCityMax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.asset('assets/city.pdf'));
  }
}
