import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSpring = true;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isSpring
          ? ThemeData(
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 220, 201, 29),
              ),
              canvasColor: Colors.yellow,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 220, 201, 29),
              ),
            )
          : ThemeData(
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 235, 141, 1),
              ),
              canvasColor: Colors.orange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 235, 141, 1),
              ),
            ),
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  isSpring = !isSpring;
                });
              },
              child: const Center(
                child: Text(
                  'change',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          items: const [
            BottomNavigationBarItem(
              label: 'item1',
              icon: Icon(Icons.access_alarm),
            ),
            BottomNavigationBarItem(
              label: 'item2',
              icon: Icon(Icons.accessibility),
            ),
            BottomNavigationBarItem(
              label: 'item3',
              icon: Icon(Icons.zoom_in_sharp),
            ),
            BottomNavigationBarItem(
              label: 'item4',
              icon: Icon(Icons.zoom_in_map),
            ),
            BottomNavigationBarItem(
              label: 'item5',
              icon: Icon(Icons.wrap_text_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
