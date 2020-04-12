import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:our_apps_template/bloc/login_bloc/login_bloc.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';
import 'package:our_apps_template/presentation/widgets/custom_button.dart';
import 'package:our_apps_template/utils/constants.dart' show Routes;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _idController.addListener(_onIdChanged);
  }

  void _onIdChanged() {
    BlocProvider.of<LoginBloc>(context).add(
      new IdChanged(id: _idController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login Page'),
      ),
      body: new SafeArea(
        child: new Center(
          child: new SingleChildScrollView(
            child: new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new BlocConsumer<LoginBloc, LoginState>(
                listener: (context, loginState) {
                  if (loginState.isFailure) {
                    print('Login Page: ${loginState.message}');
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(new SnackBar(
                        content: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(loginState.message),
                            new Icon(Icons.error)
                          ],
                        ),
                        backgroundColor: Colors.red,
                      ));
                  }

                  if (loginState.isSubmitting) {
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        new SnackBar(
                          content: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text('Logging In...'),
                              new CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      );
                  }

                  if (loginState.isSuccess) {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(new LoggedIn(loginState.user));
                  }
                },
                builder: (context, state) {
                  return new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new TextFormField(
                        validator: (_) {
                          return !state.isIdValid ? 'Invalid Id' : null;
                        },
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          disabledBorder: new OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          hintText: 'Enter user id',
                          hintStyle: AppTextStyles.mediumTextStyle,
                          counterStyle: AppTextStyles.mediumTextStyle,
                        ),
                        style: AppTextStyles.mediumTextStyle,
                        maxLength: 2,
                      ),
                      new CustomButton(
                          'Login',
                          _isLoginButtonEnabled(state)
                              ? _onLoginButtonClicked
                              : null),
                      new SizedBox(
                        height: 20,
                      ),
                      new FlatButton(
                        child: new Text(
                          'Or register',
                          style: AppTextStyles.mediumTextStyle,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.register);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isLoginButtonEnabled(LoginState state) =>
      state.isFormValid && !state.isSubmitting && _idController.text.isNotEmpty;

  void _onLoginButtonClicked() {
    BlocProvider.of<LoginBloc>(context)
        .add(new LoginClicked(id: _idController.text));
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }
}
