import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

void main() {
  runApp(const MyApp());
}

enum Mode {
  blog,
  youtube,
  podcast,
  application,
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ideaController = TextEditingController();
  final descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    ideaController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void pushIdea(Mode mode) {
    switch (mode) {
      case Mode.blog:
        print({ideaController.text, descriptionController.text, Mode.blog});
        return;
      case Mode.podcast:
        print({ideaController.text, descriptionController.text, Mode.podcast});
        return;
      case Mode.youtube:
        print({ideaController.text, descriptionController.text, Mode.youtube});
        return;
      case Mode.application:
        print({
          ideaController.text,
          descriptionController.text,
          Mode.application
        });
        return;
      default:
        throw Exception("You did something wrong");
    }
    ideaController.text = "";
    descriptionController.text = "";
  }

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
                _showModalBottomSheet(context, Mode.blog);
              },
            ),
            ItemCard(
              name: "Youtube",
              color: Vx.red700,
              imageLink:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsvPP7I9kDR137YnM-pcpoiOtgOdRMwOOGLuISPggPtzm3M8v9k1fXeYOujdykiRwL5o8&usqp=CAU",
              onTap: () {
                _showModalBottomSheet(context, Mode.youtube);
              },
            ),
            ItemCard(
              name: "Podcast",
              color: Vx.lightBlue600,
              imageLink:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Podcasts_%28iOS%29.svg/2048px-Podcasts_%28iOS%29.svg.png",
              onTap: () {
                _showModalBottomSheet(context, Mode.podcast);
              },
            ),
            ItemCard(
              name: "Projects",
              color: Vx.blueGray700,
              imageLink:
                  "https://logowik.com/content/uploads/images/visual-studio-code7642.jpg",
              onTap: () {
                _showModalBottomSheet(context, Mode.podcast);
              },
            ),
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet(BuildContext context, Mode mode) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(children: [
          Container(
            height: context.screenHeight * 0.8,
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  "Add Your idea".text.gray900.bold.size(30).make(),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.edit),
                      hintText: 'Enter your idea',
                      labelText: 'Idea',
                    ),
                    controller: ideaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.note),
                      hintText: 'Enter your Description',
                      labelText: 'Description (optional)',
                    ),
                    maxLines: 3,
                    controller: descriptionController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  [
                    "Submit"
                        .text
                        .size(20)
                        .blue700
                        .make()
                        .box
                        .roundedSM
                        .make()
                        .p12()
                        .onInkTap(() {
                      if (_formKey.currentState!.validate()) {
                        pushIdea(mode);
                      }
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    "Cancel"
                        .text
                        .size(20)
                        .red700
                        .make()
                        .box
                        .roundedSM
                        .make()
                        .p12()
                        .onInkTap(() {
                      Navigator.pop(context);
                    })
                  ].row()
                ],
              ),
            ),
          )
        ]);
      },
      isScrollControlled: true,
      isDismissible: false,
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
