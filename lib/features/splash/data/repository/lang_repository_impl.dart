import 'package:clean_architcture_islam/core/error/excaptions.dart';
import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/features/splash/data/date_source/lang_local_data_source.dart';
import 'package:clean_architcture_islam/features/splash/domain/repository/lang_repository.dart';
import 'package:dartz/dartz.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocaleDataSource langLocaleDataSource;

  LangRepositoryImpl({required this.langLocaleDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String lang}) async {
    try {
      final langIsChanged =
          await langLocaleDataSource.changeLang(langCode: lang);
      return Right(langIsChanged);
    } on ServerExcaption {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langValue = await langLocaleDataSource.getSavedLang();
      return Right(langValue!);
    } on ServerExcaption {
      return left(CacheFailure());
    }
  }
}
