// import 'dart:async';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
//   try {
//     return (await call());
//   } on DioException catch (e) {
//     showMessage(e.response?.data['message'] ?? '');
//     rethrow;
//   } on SocketException catch (e) {
//     showMessage("No internet connection ");
//     rethrow;
//   } catch (e) {
//     showMessage("Something is happening ");
//     rethrow;
//   }
// }
//
// void showMessage(String? message, {bool isSuccess = false}) {
//   print(message ?? "Something went wrong ");
// }
