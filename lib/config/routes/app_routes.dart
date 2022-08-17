import 'package:clean_architcture_islam/features/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:clean_architcture_islam/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:clean_architcture_islam/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_architcture_islam/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String intialRoute = '/';
  static const String favouriteQuoteRoute = '/favouriteQuote';
  static const String randomQuoteRoute = '/favouriteQuote';
}
///////////////////// Named Route
///
// final routes = {
//   Routes.intialRoute: (context) => const QuoteScreen(),
//   Routes.favouriteQuoteRoute: (context) => const FavouriteQuoteScreen(),
// };

///////////////////// OnGenrate Route
class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                child: const QuoteScreen(),
                create: (context) => di.sl<RandomQuoteCubit>()));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
