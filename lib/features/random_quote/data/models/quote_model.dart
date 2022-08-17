import 'package:clean_architcture_islam/features/random_quote/domain/entity/quote.dart';

class QuoteModel extends QuoteEntity {
  // QuoteModelDart({required super.author, required super.id, required super.quote, required super.permalink});

  const QuoteModel({
    required String author,
    required int id,
    required String quote,
    required String permalink,
  }) : super(author: author, id: id, quote: quote, permalink: permalink);
  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        quote: json["quote"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": quote,
        "permalink": permalink,
      };
}
