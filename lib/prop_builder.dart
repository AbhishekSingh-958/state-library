import 'package:flutter/material.dart';
import 'package:state_lib/prop_provider.dart';
import 'package:state_lib/prop_state.dart';

class PropBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) builder;

  const PropBuilder({super.key, required this.builder});

  @override
  PropBuilderState<T> createState() => PropBuilderState<T>();
}

class PropBuilderState<T> extends State<PropBuilder<T>> {
  late PropState<T> state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = PropProvider.of<T>(context);
    assert(provider != null, 'No StateProvider found for the given type.');

    state = provider!.state;
    state.addListener(_onStateChange);
  }

  @override
  void dispose() {
    state.removeListener(_onStateChange);
    super.dispose();
  }

  void _onStateChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, state.value);
  }
}
