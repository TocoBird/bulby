import 'package:flutter/material.dart'
    show AsyncSnapshot, ValueNotifier, BuildContext, Locale, Localizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:bulby/components/common/atoms/input/select.dart'
    show SelectItem;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useMemoized, useFuture;
import 'package:bulby/storage/kvs/selected_language.dart' show selectLanguage;
import 'package:bulby/modules/type/locale.dart' show LocaleCode;

class UseReturn {
  const UseReturn({
    required this.onChanged,
    required this.languages,
    required this.language,
  });

  final Function(String? t) onChanged;
  final List<SelectItem> languages;
  final String language;
}

///
UseReturn useHooks(
  BuildContext context,
  void Function(LocaleCode) changeLocale,
) {
  /// 選択している言語
  final Future<String?> memoedLanguage =
      useMemoized(() => selectLanguage.get());
  final AsyncSnapshot<String?> futuredLanguage = useFuture(memoedLanguage);

  /// 選択言語
  ValueNotifier<String> language = useState<String>('ja');

  /// 端末の言語
  Locale locale = Localizations.localeOf(context);

  /// 変更を押した
  void onChanged(String? t) {
    switch (t) {
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
    selectLanguage.save(t!);
  }

  /// 表示言語一覧
  const List<SelectItem> languages = [
    /// アラビア
    SelectItem(text: 'اللغة العربية', value: 'ar'),

    /// デンマーク
    SelectItem(text: 'Dansk', value: 'da'),

    /// ドイツ語
    SelectItem(text: 'Deutsch', value: 'de'),

    /// 英語
    SelectItem(text: 'English', value: 'en'),

    /// スペイン語
    SelectItem(text: 'Español', value: 'es'),

    /// フランス語
    SelectItem(text: 'Français', value: 'fr'),

    /// インドネシア語
    SelectItem(text: 'bahasa Indonesia', value: 'id'),

    /// イタリア語
    SelectItem(text: 'Italiano', value: 'it'),

    /// 日本語
    SelectItem(text: '日本語', value: 'ja'),

    /// 韓国語
    SelectItem(text: '한국어', value: 'ko'),

    /// ポルトガル語
    SelectItem(text: 'Português', value: 'pt'),

    /// ロシア語
    SelectItem(text: 'Русский', value: 'ru'),

    /// トルコ語
    SelectItem(text: 'Türkçe', value: 'tr'),

    /// 中国語 簡体
    SelectItem(text: '中文（简体）', value: 'zh'),

    /// 中国語 繁体
    SelectItem(text: '中文（繁體）', value: 'zh_TW'),
  ];

  useEffect(() {
    if (futuredLanguage.data == null) return;

    /// 初期選択言語
    final languageCode = locale.languageCode.toString();
    language.value = futuredLanguage.data ?? languageCode;

    return;
  }, [futuredLanguage.data]);

  return UseReturn(
    onChanged: onChanged,
    languages: languages,
    language: language.value,
  );
}
