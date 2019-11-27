import '../index.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _themeData;

  ThemeModel() {
    _themeData = ThemeData.light();
  }

  ThemeData get themeData => _themeData;

  changeTheme() {
    _themeData = _themeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}