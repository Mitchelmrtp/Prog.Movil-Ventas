import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timeapp/configs/constants.dart';
import 'dart:convert';

class AccountController extends GetxController {
  var nombre = ''.obs;
  var apellidos = ''.obs;
  var dni = ''.obs;
  var correo = ''.obs;
  var telefono = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Llamar método para obtener datos del perfil
    fetchProfileData();
  }

  void fetchProfileData() async {
    try {
      final response = await http.get(Uri.parse('${BASE_URL}Perfiles/list?code=20180038'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          nombre.value = data[0]['names'];
          apellidos.value = data[0]['last_names'];
          dni.value = data[0]['dni'];
          correo.value = data[0]['email'];
          telefono.value = data[0]['phone'];
        } else {
          // Handle empty response
          print('No se encontraron datos para el perfil especificado');
        }
      } else {
        // Handle HTTP error
        print('Error al cargar datos del perfil: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or decoding errors
      print('Error: $e');
    }
  }
}
