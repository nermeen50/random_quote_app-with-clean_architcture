import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/core/usecase.dart/usecase.dart';
import 'package:clean_architcture_islam/features/splash/domain/repository/lang_repository.dart';
import 'package:dartz/dartz.dart';

class GetSavedLangUseCase implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams param) async =>
      await langRepository.getSavedLang();
}
