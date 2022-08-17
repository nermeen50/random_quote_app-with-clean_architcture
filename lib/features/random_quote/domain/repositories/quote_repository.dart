import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/entity/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepoisitory {
  Future<Either<Failure, QuoteEntity>> getRandomQuote();
}
