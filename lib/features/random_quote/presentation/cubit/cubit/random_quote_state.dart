part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteIsLoaded extends RandomQuoteState {
  final QuoteEntity quoteModel;

  const RandomQuoteIsLoaded({required this.quoteModel});
  @override
  List<Object> get props => [quoteModel];
}

class RandomQuoteError extends RandomQuoteState {
  final String massage;

  const RandomQuoteError({required this.massage});
  @override
  List<Object> get props => [massage];
}
