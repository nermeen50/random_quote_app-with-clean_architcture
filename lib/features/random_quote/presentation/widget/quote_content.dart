import 'package:clean_architcture_islam/core/utils/app_colors.dart';
import 'package:clean_architcture_islam/core/utils/media_quary.dart';
import 'package:clean_architcture_islam/features/random_quote/domain/entity/quote.dart';
import 'package:flutter/material.dart';

class QuoteContent extends StatelessWidget {
  final QuoteEntity quoteEntity;
  const QuoteContent({Key? key, required this.quoteEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(
            quoteEntity.quote,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            quoteEntity.author,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
