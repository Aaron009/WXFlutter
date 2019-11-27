
import 'package:wxfluuter/index.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    var appString = AppStrings.of(context);

    Widget _buildLanguageItem(String language, value) {
      return ListTile(
        title: Text(
          language,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.curLanguageCode == value ? color : null),
        ),

        trailing: localeModel.curLanguageCode == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          localeModel.changeLocal(value);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appString.language),
      ),
      body: ListView(
        children: localeModel.languages.map(
            (Language item) {
                return _buildLanguageItem(item.showCode, item.languageCode);
            }
        ).toList()
      ),
    );
  }
}
