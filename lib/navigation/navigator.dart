import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyNavigator {
  final BuildContext context;
  MyNavigator(this.context);

  Future<Object?> pushNamed({
    required String routeName,
    Object? argument,
  }) async {
    return await Navigator.pushNamed(
      context,
      routeName,
      arguments: argument,
    );
  }

  void pop() {
    Navigator.pop(context);
  }
}
