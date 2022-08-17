import 'package:clean_architcture_islam/core/api/api_consumer.dart';
import 'package:clean_architcture_islam/core/api/end_points.dart';
import 'package:clean_architcture_islam/features/random_quote/data/models/quote_model.dart';

abstract class GetRandomQuoteRemoteDataSource {
  Future<QuoteModel> getRemoteRandomQuote();
}

class GetRandomQuoteRemoteDataSourceImpl
    implements GetRandomQuoteRemoteDataSource {
  ApiConsumer dioConsumer;
  GetRandomQuoteRemoteDataSourceImpl({required this.dioConsumer});
  @override
  Future<QuoteModel> getRemoteRandomQuote() async {
    final randomQuotResponse = await dioConsumer.get(EndPoints.randomQuoteUrl);
    return QuoteModel.fromJson(randomQuotResponse);
  }
}
