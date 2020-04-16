import 'dart:async';
import 'package:bloc_login/model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final userDao = UserDao();

  Future<String> authenticate ({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(
      username: username,
      password: password
    );
    Token token = await getToken(userLogin);
    return token.token.toString();
  }

  Future<void> persistToken ({
    @required String username,
    @required String token
    }) async {
    // write token with the user to the database
      User user = User(
        username: username,
        token: token
      );
      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      await userDao.createUser(user);
      prefs.setString("username", username);
  }

  Future <void> delteToken({
    @required String username
  }) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    await userDao.deleteUser(username);
    prefs.clear();
  }

  Future <bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username");
    if (username != null){
      return true;
    }
    return false;
  }
}