import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SendEmail {
  Future<String> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_lvkop4e';
    const templateId = 'template_p6cmzq1';
    const userId = 'aWKfVBuO6K9YUCzPcT6ex';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http
        .post(
          url,
          headers: {
            'origin': 'http://localhost',
            'Content_Type': 'application/json',
          },
          body: jsonEncode(
            {
              'service_id': serviceId,
              'template_id': templateId,
              'user_id': userId,
              'teplate_params': {
                'user_name': name,
                'user_email': email,
                // 'to_email': 'numanjaved14@gmail.com',
                'user_subject': subject,
                'user_message': message,
              },
            },
          ),
        )
        .then(
          (value) => debugPrint(
            value.body.toString(),
          ),
        );

    return 'Email Called';
  }
}
