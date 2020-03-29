// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/api_service.dart';

void main() {
  test('api test', () async {
    final api = ApiService();
    final result = await api.dio.get('/users');
    final converted = result.data.map((x) => User.fromJson(x)).toList();
    print(converted);
  });
}
