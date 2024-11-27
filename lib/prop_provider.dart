import 'package:flutter/material.dart';
import 'package:state_lib/prop_state.dart';

class PropProvider<T> extends InheritedWidget {
  final PropState<T> state;

  const PropProvider({
  super.key,
    required this.state,
    Widget? child,
  }): super(child: child ?? const SizedBox.shrink());

  static PropProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PropProvider<T>>();
  }

  @override
  bool updateShouldNotify(PropProvider oldWidget) => state.value != oldWidget.state.value;
}
