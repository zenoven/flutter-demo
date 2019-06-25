import 'package:flutter_demo/screens/detail.dart';
import 'package:flutter_demo/screens/saved.dart';
import 'package:flutter_demo/screens/test.dart';

final routes = {
  'saved': (buildContext) => new Saved(),
  'detail': (buildContext) => new Detail(),
  'test': (buildContext) => new Test(),
};
