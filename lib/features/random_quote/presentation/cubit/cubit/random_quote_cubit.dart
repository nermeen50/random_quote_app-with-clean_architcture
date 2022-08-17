import 'package:bloc/bloc.dart';
import 'package:clean_architcture_islam/core/error/failures.dart';
import 'package:clean_architcture_islam/core/usecase.dart/usecase.dart';
import 'package:clean_architcture_islam/core/utils/app_strings.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/entity/quote.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());
  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, QuoteEntity> response =
        await getRandomQuoteUseCase(NoParams());
    response.fold(
        (failure) => emit(RandomQuoteError(massage: _mapFailureToMsg(failure))),
        (successQuote) => emit(RandomQuoteIsLoaded(quoteModel: successQuote)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
