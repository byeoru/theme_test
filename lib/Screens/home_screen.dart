import 'package:flutter/material.dart';
import 'package:test/main.dart';
import '../widgets/custom_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppState parent = context.findAncestorStateOfType<MyAppState>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () {
            parent.setState(() {
              parent.isSpring = !parent.isSpring;
            });
          },
          child: const Center(
            child: Text(
              'Theme change',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
        CustomDialog()
      ],
    );
  }
}
