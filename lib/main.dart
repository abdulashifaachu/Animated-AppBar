import 'package:flutter/material.dart';
import 'widgets/animated_app_bar.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated AppBar',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AnimatedTitleAppBar(
        titles: ['Welcome', 'Hello User', 'Dashboard', 'Your Stats'],
      ),
      body: const Center(child: Text("Body Content")),
    );
  }
}
