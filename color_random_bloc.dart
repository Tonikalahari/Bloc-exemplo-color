import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<int> {
  ColorCubit() : super(Random().nextInt(colorMap.length));

  void nextRandonColor() => emit(Random().nextInt(colorMap.length));
}

class ColorContainer extends StatelessWidget {
  const ColorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorCubit(),
      child: const Color(),
    );
  }
}

class Color extends StatelessWidget {
  const Color({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Random Color'),
      ),
      body: Center(
        child: BlocBuilder<ColorCubit, int>(builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: GestureDetector(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorMap[state],
                        boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15)]),
                    child: const Center(
                        child: Text(
                      'Press this buttom',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ),
                  onTap: () {
                    context.read<ColorCubit>().nextRandonColor();
                  },
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 32, left: 16.0),
                child: Card(
                  child: Text(
                    'A cor do botão está sendo fornecida através de um BlocProvider.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

final Map colorMap = {
  0: Colors.pink,
  1: Colors.blue,
  2: Colors.red, 
  3: Colors.green,
  4: Colors.yellow,
  5: Colors.purple,
};
