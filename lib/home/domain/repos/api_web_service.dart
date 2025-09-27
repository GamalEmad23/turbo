import 'package:dio/dio.dart';

class ApiWebService {
  final Dio dio;

  ApiWebService({required this.dio});

 Future<Response> apiRespinse()async{
  final Response response =await dio.get("");
  return response;
 }
  
}
