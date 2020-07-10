/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter/material.dart';

import '../shared/app_text_styles.dart';

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
