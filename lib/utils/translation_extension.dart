import 'package:flutter/material.dart';
import 'package:our_apps_template/utils/app_localizations.dart';

extension Translator on Text {
  Text translate(BuildContext context) {
    return copyWith(context);
  }

  Text copyWith(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate(data),
      key: this.key,
      style: this.style,
      strutStyle: this.strutStyle,
      textAlign: this.textAlign,
      textDirection: this.textDirection,
      locale: this.locale,
      softWrap: this.softWrap,
      overflow: this.overflow,
      textScaleFactor: this.textScaleFactor,
      maxLines: this.maxLines,
      semanticsLabel: this.semanticsLabel,
      textWidthBasis: this.textWidthBasis,
    );
  }
}
