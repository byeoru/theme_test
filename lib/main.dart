import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
  var isDialOpen = ValueNotifier<bool>(false);

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
        drawer: Drawer(
          backgroundColor: Colors.amber,
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'header',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('App Bar'),
        ),
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
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          openCloseDial: isDialOpen,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.accessibility),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'First',
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.brush),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Second',
            ),
            SpeedDialChild(
              child: const Icon(Icons.margin),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'Show Snackbar',
              visible: true,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(("Third Child Pressed")))),
              onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),
      ),
    );
  }
}
