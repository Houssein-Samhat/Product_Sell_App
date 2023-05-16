import 'package:flutter/material.dart';
import 'package:product_selling/pages/dashboard_page.dart';
import 'package:product_selling/pages/registration_page.dart';
import 'package:product_selling/providers/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DataHolder())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Products Selling'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/registration': (context) => RegistrationPage(),
        '/dashboard': (context) => DashBoardPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            const SizedBox(
              width: 5,
            ),
            IconButton(
              icon: const Icon(Icons.dashboard_customize),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Welcome to our Application',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
