import 'package:flutter/material.dart';
import 'package:our_apps_template/presentation/dialogs/log_out_dialog.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => LogOutDialog(),
                barrierDismissible: false,
              );
            },
          ),
        ],
      ),
      body: new Center(
        child: new Text(
          'Home Page',
          style: AppTextStyles.largeTextStyle,
        ),
      ),
    );
  }
}
