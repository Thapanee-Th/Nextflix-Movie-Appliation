import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<String>> fetchData() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      return List<String>.from(
          response.data.map((item) => item['title'] as String));
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
