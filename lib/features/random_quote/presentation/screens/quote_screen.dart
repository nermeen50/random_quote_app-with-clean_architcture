import 'package:clean_architcture_islam/config/locale/app_localizations.dart';
import 'package:clean_architcture_islam/core/utils/app_colors.dart';
import 'package:clean_architcture_islam/features/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:clean_architcture_islam/features/random_quote/presentation/widget/quote_content.dart';
import 'package:clean_architcture_islam/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architcture_islam/core/widgets/error_widget.dart'
    as error_widget;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                BlocProvider.of<LocaleCubit>(context).toArabic();
              } else {
                BlocProvider.of<LocaleCubit>(context).toEnglish();
              }
            },
            icon: const Icon(
              Icons.translate,
              color: AppColors.primaryColor,
            )),
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      ),
      body: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
          builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
                decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ));
          });
        } else if (state is RandomQuoteError) {
          return Center(
            child: error_widget.ErrorWidget(
              press: () => _getRandomQuote(),
            ),
          );
        } else if (state is RandomQuoteIsLoaded) {
          return Column(
            children: [
              QuoteContent(quoteEntity: state.quoteModel),
              InkWell(
                onTap: () => _getRandomQuote(),
                child: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.refresh, color: Colors.white),
                ),
              )
            ],
          );
        } else {
          return const SpinKitFadingCircle(color: AppColors.primaryColor);
        }
      }),
    );
  }
}
