import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<Unit> cacheId(String id);

  Future<String> getId();

  Future<Unit> cacheToken(String token);

  Future<String> getToken();

  Future<Unit> removeToken(String token);

  Future<Unit> cacheUsername(String username);

  Future<String> getUsername();

  Future<Unit> setLoggedIn(bool value);

  Future<bool> isLoggedIn();
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheId(String id) {
    sharedPreferences.setString("id", id);
    return Future.value(unit);
  }

  @override
  Future<String> getId() {
    final id = sharedPreferences.getString("id");
    return Future.value(id);
  }

  @override
  Future<Unit> cacheToken(String token) {
    sharedPreferences.setString("token", token);
    return Future.value(unit);
  }

  @override
  Future<String> getToken() {
    final token = sharedPreferences.getString("token");
    return Future.value(token);
  }

  @override
  Future<Unit> removeToken(String token) {
    sharedPreferences.remove("token");
    setLoggedIn(false);
  return Future.value(unit);
  }

  @override
  Future<Unit> setLoggedIn(bool value) {
    sharedPreferences.setBool('isLoggedIn', value);
    return Future.value(unit);
  }

  @override
  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  @override
  Future<Unit> cacheUsername(String username) {
    sharedPreferences.setString("username", username);
    return Future.value(unit);
  }

  @override
  Future<String> getUsername() {
    final token = sharedPreferences.getString("username");
    return Future.value(token);
  }
}
