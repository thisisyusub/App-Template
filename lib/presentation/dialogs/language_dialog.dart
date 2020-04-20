import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/language_bloc/language_bloc.dart';
import 'package:our_apps_template/utils/constants.dart';
import 'package:our_apps_template/utils/enums.dart';
import '../../utils/translation_extension.dart';

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LanguageKeys.selectLanguage).translate(context),
      content: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Flags.getMiniFlag('AZ', 50, 0),
              onTap: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageSelected(Language.AZ));
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Flags.getMiniFlag('US', 50, 0),
              onTap: () {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageSelected(Language.EN));
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Flags.getMiniFlag('RU', 50, 0),
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
