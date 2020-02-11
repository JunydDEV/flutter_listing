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
  List<Pet> petsList = <Pet>[
    Pet("DOG",
        'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg'),
    Pet("CAT",
        "https://images.unsplash.com/photo-1567170578400-9d182981f2a1?ixlib=rb-1.2.1&w=1000&q=80"),
    Pet("BIRD",
        "https://www.audubon.org/sites/default/files/styles/hero_image/public/web_groombaltimoreoriole-and-a-male-red-breasted-grosbeak.jpg?itok=GFL3jy0c"),
    Pet("FISH",
        "https://images.pexels.com/photos/128756/pexels-photo-128756.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "PETS",
        ),
      ),
      body: ListView.builder(
        itemCount: petsList.length,
        addAutomaticKeepAlives: false,
        itemBuilder: (BuildContext context, int index) {
          return petCellWidget(index);
        },
      ),
    );
  }

  Widget petCellWidget(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,offset:Offset(0.0,1.0),blurRadius: 10.0)]),
        height: 100,
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
              child: FadeInImage.assetNetwork(
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: "images/loader.gif",
                  image: petsList[index].petImage),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(petsList[index].petName,style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    bottomLeft: Radius.circular(0.0),
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pet {
  String petName, petImage;

  Pet(this.petName, this.petImage);
}
