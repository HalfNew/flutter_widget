import 'package:dio/dio.dart';


class httpUtil {
  static BaseOptions _options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000
  );

 static Dio _dio = new Dio(_options);

  static Future<String> getHttpData(String url) async {
    Response<String> resp =  await _dio.get<String>(url);
    return resp.data;
  }

}