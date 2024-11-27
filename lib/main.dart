import 'package:flutter/material.dart';
import 'package:state_lib/prop_builder.dart';
import 'package:state_lib/prop_provider.dart';
import 'package:state_lib/prop_state.dart';
import 'package:state_lib/school.dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PropState<int> counterState = PropState<int>(0);
    final PropState<School> schoolState =
        PropState<School>(School(name: '', location: '', totalStudents: 100));
    return PropProvider(
      state: schoolState,
      child: PropProvider(
        state: counterState,
        child: const MaterialApp(
          home: CounterScreen(),
        ),
      ),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateProvider = PropProvider.of<int>(context);
    final schoolProvider = PropProvider.of<School>(context);
    final schoolState = schoolProvider!.state;

    final counterState = stateProvider!.state;

    return Scaffold(
      appBar: AppBar(title: const Text('State Management Library')),
      body: Center(
        child: Column(
          children: [
            PropBuilder<School>(
              builder: (context, value) => Text(
                'total Students: ${value.totalStudents}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            PropBuilder<int>(
              builder: (context, value) => Text(
                'Counter: $value',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      schoolState.update((currentSchool) {
                        return currentSchool.copyWith(
                            totalStudents: currentSchool.totalStudents + 1);
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      counterState.value++;
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
