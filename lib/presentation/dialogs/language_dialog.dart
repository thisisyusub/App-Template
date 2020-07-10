/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flag/flag.dart';

import '../../bloc/language_bloc/language_bloc.dart';
import '../../utils/constants/constants.dart';
import '../../utils/constants/enums.dart';
import '../../utils/extensions/translation_extension.dart';

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LanguageKeys.selectLanguage).translate(context),
      content: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Flag(
                'AZ',
                height: 50,
                width: 0,
              ),
              onTap: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageSelected(Language.AZ));
              },
            ),
          ),
          Spacer(),
          Expanded(
            child: GestureDetector(
              child: Flag(
                'US',
                height: 50,
                width: 0,
              ),
              onTap: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageSelected(Language.EN));
              },
            ),
          ),
          Spacer(),
          Expanded(
            child: GestureDetector(
              child: Flag(
                'RU',
                height: 50,
                width: 0,
              ),
              onTap: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageSelected(Language.RU));
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(LanguageKeys.cancel).translate(context),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
