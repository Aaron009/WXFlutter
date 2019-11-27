import 'package:flutter_localizations/flutter_localizations.dart';

import '../app_strings.dart';
import '../index.dart';

class Language {
  String languageCode;
  String countryCode;
  String showCode; // 展示文本
}

class LocaleModel extends ChangeNotifier {
  static LocaleModel instance;

  final String key = "LocaleModel";

  //只支持美国英语和中文简体
  List<Locale> supportedLocales;
  //代理
  Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;

  Locale _locale;
  Locale get locale => _locale;

  List<Language> languages;

  LocaleModel() {
    instance = this;

    init();
    String configStr = SpUtil.getString(key, defValue: "");

    if (configStr != "") {
      List<String> list = configStr.split('|');
      _locale = Locale(list[0], list[1]);
    }
  }

  void init() {
    languages = [
      Language()
        ..languageCode = 'en'
        ..countryCode = 'US'
        ..showCode = 'English',

      Language()
        ..languageCode = 'zh'
        ..countryCode = 'CN'
        ..showCode = '中文简体',
    ];

    supportedLocales = [];
    for (Language item in languages) {
      supportedLocales.add(Locale(item.languageCode, item.countryCode));
    }

    localizationsDelegates = [
      AppLocalizationsDelegate(),
      // 本地化的代理类
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }

  Locale localeResolutionCallback(
      Locale locale, Iterable<Locale> supportedLocales) {
    //如果已经选定语言，则使用选择语言
    if (this._locale != null) return this._locale;

    //跟随系统
    if (supportedLocales.contains(locale)) {
      return locale;
    } else {
      //如果系统语言不是中文简体或美国英语，则默认使用美国英语
      return Locale('en', 'US');
    }
  }

  void changeLocal(String languageCode) {
    if (_locale != null && _locale.languageCode == languageCode) {
        return;
    }

    for (var item in supportedLocales) {
      if(item.languageCode == languageCode) {
        _locale = item;
        SpUtil.putString(key, "${item.languageCode}|${item.countryCode}");
        notifyListeners();
      }
    }
  }

  String get curLanguageCode {
      if (_locale == null) return null;
      else return _locale.languageCode;
  }
}

// 创建localization代理
class AppLocalizationsDelegate extends LocalizationsDelegate<AppStrings> {

  @override
  Future<AppStrings> load(Locale locale) {
    return AppStrings.load(locale);
  }

  // 支持的类型要包含App中注册的类型
  @override
  bool isSupported(Locale locale) {
    for (Language item in LocaleModel.instance.languages) {
       if(item.languageCode.contains(locale.languageCode))
          return true;
    }
    return false;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}