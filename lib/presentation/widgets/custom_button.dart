import 'package:flutter/material.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onButtonClicked;

  CustomButton(this.title, this.onButtonClicked) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: RaisedButton(
        onPressed: onButtonClicked,
        child: Text(
          title,
          style: AppTextStyles.mediumTextStyleV2,
        ),
      ),
    );
  }
}
