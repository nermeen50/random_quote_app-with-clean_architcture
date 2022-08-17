import 'package:clean_architcture_islam/config/locale/app_localizations.dart';
import 'package:clean_architcture_islam/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? press;
  const ErrorWidget({Key? key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_rounded,
              color: AppColors.primaryColor, size: 150),
          Text(AppLocalizations.of(context)!.translate('something_went_wrong')!,
              style: const TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold)),
          Text(AppLocalizations.of(context)!.translate('try_again')!,
              style: const TextStyle(color: AppColors.hint)),
          ElevatedButton(
            onPressed: press,
            child:
                Text(AppLocalizations.of(context)!.translate('reload_screen')!),
          )
        ],
      ),
    );
  }
}
