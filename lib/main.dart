import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: "Add Idea".text.bold.size(25).make(),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            ItemCard(
              name: "Blog",
              color: Vx.blueGray700,
              imageLink:
                  "https://cdn.mos.cms.futurecdn.net/uazw6gFQuEC29mxMM55Tpb.jpg",
              onTap: () {
                print("Blog");
              },
            ),
            ItemCard(
              name: "Youtube",
              color: Vx.red700,
              imageLink:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsvPP7I9kDR137YnM-pcpoiOtgOdRMwOOGLuISPggPtzm3M8v9k1fXeYOujdykiRwL5o8&usqp=CAU",
              onTap: () {
                print("Youtube");
              },
            ),
            ItemCard(
              name: "Podcast",
              color: Vx.lightBlue600,
              imageLink:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Podcasts_%28iOS%29.svg/2048px-Podcasts_%28iOS%29.svg.png",
              onTap: () {
                print("Podcast");
              },
            ),
            ItemCard(
              name: "Projects",
              color: Vx.blueGray700,
              imageLink:
                  "https://logowik.com/content/uploads/images/visual-studio-code7642.jpg",
              onTap: () {
                print("Projects");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String name;
  final Color color;
  final Function onTap;
  final String imageLink;
  const ItemCard({
    Key? key,
    required this.name,
    required this.color,
    required this.onTap,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              (imageLink).circularNetworkImage(radius: 30),
              const SizedBox(
                height: 20,
              ),
              (name).text.black.bold.size(25).make(),
            ])
            .box
            .make()
            .onInkTap(() => onTap())
            .card
            .roundedLg
            .elevation(10)
            .make(),
      ),
    );
  }
}
