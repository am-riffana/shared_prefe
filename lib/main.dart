import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('name', 'John');
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = '';

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'No Name';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          title:  Text('SharedPreferences Demo'),
        ),
        body: Center(
          child: Text(
            'Hello $name',
            style:  TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
