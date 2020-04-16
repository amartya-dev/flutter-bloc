import 'package:bloc_login/database/user_database.dart';
import 'package:bloc_login/model/user_model.dart';

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(User user) async {
    final db = await dbProvider.database;

    var result = db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> deleteUser(String username) async {
    final db = await dbProvider.database;
    var result = await db
        .delete(userTable, where: "username = ?", whereArgs: [username]);
    return result;
  }

  Future<bool> checkUser(String username) async {
    final db = await dbProvider.database;
    try {
      List<Map> users = await db
          .query(userTable, where: 'username = ?', whereArgs: [username]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
