import 'package:clean_architcture_islam/core/error/excaptions.dart';
import 'package:clean_architcture_islam/core/netwok/network_info.dart';
import 'package:clean_architcture_islam/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:clean_architcture_islam/features/random_quote/data/datasources/random_quote_remote_datasource.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/entity/quote.dart';
import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryImpl extends QuoteRepoisitory {
  final NetworkInfo networkInfo;
  final GetRandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final GetRandomQuoteRemoteDataSource randomQuoteRandomDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteLocalDataSource,
      required this.randomQuoteRandomDataSource});
  @override
  Future<Either<Failure, QuoteEntity>> getRandomQuote() async {
    // if (await networkInfo.isConnected) {
    try {
      final randomQuote =
          await randomQuoteRandomDataSource.getRemoteRandomQuote();
      randomQuoteLocalDataSource.cacheQuote(randomQuote);
      return Right(randomQuote);
    } on ServerExcaption {
      return left(ServerFailure());
    }
    // } else {
    //   try {
    //     final cahceRandomQuote =
    //         await randomQuoteLocalDataSource.getLastRandomQuote();
    //     return Right(cahceRandomQuote);
    //   } on CacheExcaption {
    //     return left(CacheFailure());
    //   }
    // }
  }
}
