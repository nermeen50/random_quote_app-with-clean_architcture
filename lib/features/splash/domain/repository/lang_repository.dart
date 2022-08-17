import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String lang});
  Future<Either<Failure, String>> getSavedLang();
}
