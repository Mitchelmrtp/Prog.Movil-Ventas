import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:timeapp/pages/signin/signin_page.dart';
import '../home/home_page.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var message = "".obs;
  var messageColor = Colors.yellow.obs;

  Future<void> login(BuildContext context) async {
    String user = userController.text;
    String password = passwordController.text;

    // Realiza una solicitud POST al servidor Ruby
    var url = Uri.parse('http://192.168.18.35:4912/user/validate');
    var response = await http.post(url, body: {
      'user': user,
      'password': password,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Usuario encontrado
      message.value = 'usuario encontrado';
      messageColor.value = Colors.green;
      Future.delayed(Duration(seconds: 5), () {
        message.value = '';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    } else {
      // Usuario no encontrado
      message.value = 'usuario no encontrado';
      messageColor.value = Colors.red;
      Future.delayed(Duration(seconds: 5), () {
        message.value = '';
      });
    }
  }

  void goResetPassword(BuildContext context) {
    print('nos vamos ResetPassword');
  }

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
}
