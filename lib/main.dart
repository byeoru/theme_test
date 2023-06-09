import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test/Screens/fifth_screen.dart';
import 'package:test/Screens/fourth_screen.dart';
import 'package:test/Screens/home_screen.dart';
import 'package:test/Screens/second_screen.dart';
import 'package:test/Screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isSpring = true;
  int _selectedIndex = 0;
  var isDialOpen = ValueNotifier<bool>(false);
  List<Widget> pages = [
    const HomeScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourthScreen(),
    const FifthScreen(),
  ];

  @override
  void initState() {
    print('first screen init');
    super.initState();
  }

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
        drawer: setDrawer(),
        appBar: setAppBar(),
        body: pages[_selectedIndex],
        bottomNavigationBar: setNavigationBar(context),
        floatingActionButton: setFloatingActionButton(context),
      ),
    );
  }

  Drawer setDrawer() {
    return Drawer(
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
    );
  }

  SpeedDial setFloatingActionButton(BuildContext context) {
    return SpeedDial(
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
    );
  }

  BottomNavigationBar setNavigationBar(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }

  AppBar setAppBar() {
    return AppBar(
      title: const Text('App Bar'),
    );
  }
}
