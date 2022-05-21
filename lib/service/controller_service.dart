import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nasa_api/model/apod.dart';
import 'package:nasa_api/service/interface_service.dart';

class ControllerService implements InterfaceService {
  var dio = Dio();
  @override
  Future<Apod?> getApiNasa() async {
    try {
      var response = await dio.get(
          'https://api.nasa.gov/planetary/apod?api_key=AdhRC4a5cAIGBbTqQ8phxFeYD557Bl1z2MZEWa2y');

      try {
        print('AQUI ${response.data}');
        return Apod.fromMap(response.data);
      } catch (e) {
        log(e.toString());
      }

      return response.data;
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
