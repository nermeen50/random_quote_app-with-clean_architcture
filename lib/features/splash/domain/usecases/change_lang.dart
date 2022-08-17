import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/core/usecase.dart/usecase.dart';
import 'package:clean_architcture_islam/features/splash/domain/repository/lang_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeLocaleUseCase implements UseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLocaleUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(lang: langCode);
}
