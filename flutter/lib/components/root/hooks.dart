import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Locale, AsyncSnapshot;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useEffect, useFuture, useMemoized;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show initDatabase, DBConnection;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;
import 'package:gamer_reflection/storage/kvs/selected_language.dart'
    show selectLanguage;
import 'package:gamer_reflection/api/query/controller/root.dart'
    show FetchRootPage;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class UseReturn {
  const UseReturn({
    required this.isNoSetReflectionGroup,
    required this.locale,
    required this.supportedLocales,
    required this.canDC,
    required this.changeLocale,
    required this.changeTabPage,
  });

  final bool? isNoSetReflectionGroup;
  final Locale? locale;
  final List<Locale> supportedLocales;
  final ValueNotifier<bool> canDC;
  final void Function(LocaleCode) changeLocale;
  final void Function() changeTabPage;
}

UseReturn useHooks(BuildContext context) {
  /// 選択している言語
  final Future<String?> memoedLanguage =
      useMemoized(() => selectLanguage.get());
  final AsyncSnapshot<String?> futuredLanguage = useFuture(memoedLanguage);

  final ValueNotifier<bool?> isNoSetReflectionGroup = useState<bool?>(null);
  final ValueNotifier<Locale?> locale = useState<Locale?>(null);
  final ValueNotifier<bool> canDC = useState<bool>(false);

  /// 初期
  Future<void> setUp() async {
    Database db = await initDatabase();
    GetIt.I.registerSingleton<DBConnection>(DBConnection(db: db));
  }

  /// データベースをセットアップ
  /// グループを登録しているか取得
  Future<void> setData() async {
    await setUp();

    final groupsExist = await FetchRootPage().reflectionGroupsExist();
    isNoSetReflectionGroup.value = !groupsExist;

    canDC.value = true;
  }

  /// 言語を変更する
  void changeLocale(LocaleCode localeCode) {
    switch (localeCode) {
      case LocaleCode.ar:
        locale.value = const Locale('ar');
        break;
      case LocaleCode.da:
        locale.value = const Locale('da');
        break;
      case LocaleCode.de:
        locale.value = const Locale('de');
        break;
      case LocaleCode.en:
        locale.value = const Locale('en');
        break;
      case LocaleCode.es:
        locale.value = const Locale('es');
        break;
      case LocaleCode.fr:
        locale.value = const Locale('fr');
        break;
      case LocaleCode.id:
        locale.value = const Locale('id');
        break;
      case LocaleCode.it:
        locale.value = const Locale('it');
        break;
      case LocaleCode.ja:
        locale.value = const Locale('ja');
        break;
      case LocaleCode.ko:
        locale.value = const Locale('ko');
        break;
      case LocaleCode.pt:
        locale.value = const Locale('pt');
        break;
      case LocaleCode.ru:
        locale.value = const Locale('ru');
        break;
      case LocaleCode.tr:
        locale.value = const Locale('tr');
        break;
      case LocaleCode.zh:
        locale.value = const Locale('zh');
        break;
      case LocaleCode.zhTW:
        locale.value = const Locale('zh', 'TW');
        break;
      default:
    }
  }

  /// タブページに移動する
  void changeTabPage() {
    isNoSetReflectionGroup.value = false;
  }

  useEffect(() {
    setData();
    return;
  }, []);

  useEffect(() {
    if (futuredLanguage.data == null) return;

    final machineLocaleCode = futuredLanguage.data;
    switch (machineLocaleCode) {
      case 'ar':
        changeLocale(LocaleCode.ar);
        break;
      case 'da':
        changeLocale(LocaleCode.da);
        break;
      case 'de':
        changeLocale(LocaleCode.de);
        break;
      case 'en':
        changeLocale(LocaleCode.en);
        break;
      case 'es':
        changeLocale(LocaleCode.es);
        break;
      case 'fr':
        changeLocale(LocaleCode.fr);
        break;
      case 'id':
        changeLocale(LocaleCode.id);
        break;
      case 'it':
        changeLocale(LocaleCode.it);
        break;
      case 'ja':
        changeLocale(LocaleCode.ja);
        break;
      case 'ko':
        changeLocale(LocaleCode.ko);
        break;
      case 'pt':
        changeLocale(LocaleCode.pt);
        break;
      case 'ru':
        changeLocale(LocaleCode.ru);
        break;
      case 'tr':
        changeLocale(LocaleCode.tr);
        break;
      case 'zh':
        changeLocale(LocaleCode.zh);
        break;
      case 'zh_TW':
        changeLocale(LocaleCode.zhTW);
        break;
      default:
    }

    return;
  }, [futuredLanguage.data]);

  /// 言語
  const supportedLocales = [
    ...AppLocalizations.supportedLocales,
    Locale.fromSubtags(
      languageCode: 'zh',
      scriptCode: 'Hans',
    ),
    Locale.fromSubtags(
      languageCode: 'zh',
      scriptCode: 'Hant',
    ),
    Locale.fromSubtags(
      languageCode: 'zh',
      scriptCode: 'Hans',
      countryCode: 'CN',
    ),
    Locale.fromSubtags(
      languageCode: 'zh',
      scriptCode: 'Hant',
      countryCode: 'TW',
    ),
    Locale.fromSubtags(
      languageCode: 'zh',
      scriptCode: 'Hant',
      countryCode: 'HK',
    ),
  ];

  return UseReturn(
    isNoSetReflectionGroup: isNoSetReflectionGroup.value,
    locale: locale.value,
    supportedLocales: supportedLocales,
    canDC: canDC,
    changeLocale: changeLocale,
    changeTabPage: changeTabPage,
  );
}
