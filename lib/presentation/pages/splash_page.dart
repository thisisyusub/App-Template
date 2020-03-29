import 'package:flutter/material.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';

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
          'Template App',
          style: AppTextStyles.largeTextStyle,
        ),
      ),
    );
  }
}
