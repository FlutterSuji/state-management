import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inhertied Widget Example',
      home: MyHomeScreen(),
    );
  }
}

class FrogColor extends InheritedWidget {
  const FrogColor({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

  final Color color;

  static FrogColor of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FrogColor) as FrogColor;
  }

  @override
  bool updateShouldNotify(FrogColor old) => color != old.color;
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget Example'),
      ),
      body: FrogColor(
        color: Colors.blue,
        child: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Frog Color',
                  style: TextStyle(color: FrogColor.of(context).color),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
