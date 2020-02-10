import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<MyHomePage> {
  List<Dev> devsList = <Dev>[
    Dev("ALI", "iOS"),
    Dev("Ahmad", "Android"),
    Dev("Akbar", "Android"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: devsList.length,
        addAutomaticKeepAlives: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.all(Radius.circular(10.0))),
              height: 50,
              child: Center(
                  child: Text(
                      '${devsList[index].devName} - ${devsList[index].devTitle}')),
            ),
          );
        },
      ),
    );
  }
}

class Dev {
  String devName, devTitle;

  Dev(this.devName, this.devTitle);
}
