import 'dart:convert';

import 'package:clean_architcture_islam/core/error/excaptions.dart';
import 'package:clean_architcture_islam/core/utils/app_strings.dart';
import 'package:clean_architcture_islam/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetRandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class GetRandomQuoteLocalDataSourceImpl
    implements GetRandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  GetRandomQuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cachRandomQuote = QuoteModel.fromJson(json.decode(jsonString));
      return Future.value(cachRandomQuote);
    } else {
      throw CacheExcaption();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quoteModel));
  }
}
