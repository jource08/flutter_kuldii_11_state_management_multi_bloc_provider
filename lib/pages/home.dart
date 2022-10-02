import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import '../bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc mycounter = context.read<CounterBloc>();
    ThemeBloc mytheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text("HOME")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // call to theme bloc
          mytheme.changeTheme();
        },
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<CounterBloc, int>(
            bloc: mycounter,
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(fontSize: 50),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    mycounter.remove();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    mycounter.add();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      )),
    );
  }
}
