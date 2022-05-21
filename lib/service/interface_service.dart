import 'package:nasa_api/model/apod.dart';

abstract class InterfaceService {
  Future<Apod?> getApiNasa();
}
