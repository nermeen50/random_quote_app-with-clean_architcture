import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/core/usecase.dart/usecase.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/entity/quote.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomQuote implements UseCase<QuoteEntity, NoParams> {
  final QuoteRepoisitory quoteRapository;

  GetRandomQuote({required this.quoteRapository});
  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams param) {
    return quoteRapository.getRandomQuote();
  }
}

/////// If exsist Parameter
class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({required this.userName, required this.password});
  @override
  List<Object?> get props => [];
}
