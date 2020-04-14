import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/language_bloc/language_bloc.dart';
import 'package:our_apps_template/utils/app_localizations.dart';
import 'package:our_apps_template/utils/constants.dart';
import 'package:our_apps_template/utils/enums.dart';

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          AppLocalizations.of(context).translate(LanguageKeys.selectLanguage)),
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
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child:
              Text(AppLocalizations.of(context).translate(LanguageKeys.cancel)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
