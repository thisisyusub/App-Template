import 'package:flutter/material.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/presentation/dialogs/log_out_dialog.dart';

class CustomDrawer extends StatelessWidget {
  final User userData;

  CustomDrawer(this.userData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userData.username),
            accountEmail: Text(userData.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(userData.id.toString()),
            ),
            arrowColor: Colors.red,
          ),
          SwitchListTile(
            value: false,
            onChanged: (_) {},
            title: Text('Enable dark mode'),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {},
            title: Text('Change language'),
            trailing: Icon(Icons.language),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {},
            title: Text('About'),
            trailing: Icon(Icons.info_outline),
          ),
          Divider(height: 0),
          ListTile(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => LogOutDialog(),
                barrierDismissible: false,
              );
            },
            title: Text('Log out'),
            trailing: Icon(Icons.exit_to_app),
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
