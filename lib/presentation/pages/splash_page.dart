import 'package:flutter/material.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';
import 'package:our_apps_template/utils/constants.dart';
import '../../utils/translation_extension.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          LanguageKeys.templateApp,
          style: AppTextStyles.largeTextStyle,
        ).translate(context),
      ),
    );
  }
}
