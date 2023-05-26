import 'package:flutter/material.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Fifth Screen',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
