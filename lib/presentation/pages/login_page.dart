import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:our_apps_template/bloc/login_bloc/login_bloc.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';
import 'package:our_apps_template/presentation/widgets/custom_button.dart';
import 'package:our_apps_template/utils/constants.dart' show Routes;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _idController.addListener(_onIdChanged);
  }

  void _onIdChanged() {
    BlocProvider.of<LoginBloc>(context).add(
      IdChanged(id: _idController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, loginState) {
                  if (loginState.isFailure) {
                    print('Login Page: ${loginState.message}');
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(loginState.message),
                            Icon(Icons.error)
                          ],
                        ),
                        backgroundColor: Colors.red,
                      ));
                  }

                  if (loginState.isSubmitting) {
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Logging In...'),
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      );
                  }

                  if (loginState.isSuccess) {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedIn());
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        validator: (_) {
                          return !state.isIdValid ? 'Invalid Id' : null;
                        },
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                      CustomButton(
                        'Login',
                        _isLoginButtonEnabled(state)
                            ? _onLoginButtonClicked
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: Text(
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
        .add(LoginClicked(id: _idController.text));
  }
}
