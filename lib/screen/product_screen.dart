import 'package:flutter/material.dart';
import 'package:fruit_app_ui/model/list_item.dart';

class ProductScreen extends StatefulWidget {
  final ListItem item;

  const ProductScreen({this.item});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(int.parse(widget.item.color))),
        home: Scaffold(
            backgroundColor: Color(int.parse(widget.item.color)),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height < 600
                    ? null
                    : MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        56,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Text(
                                widget.item.name,
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Hero(
                                tag: widget.item.name,
                                child: Image(
                                  image: AssetImage(
                                      "assets/fruits/" + widget.item.image),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: Text(
                                "Description",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                widget.item.longDescription,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 60.0,
                          child: Stack(children: [
                            Positioned(
                              bottom: 15.0,
                              left: 20.0,
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: widget.item.price + ".00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0)),
                                  TextSpan(
                                      text: " (" + widget.item.kg + ")",
                                      style: TextStyle(fontSize: 14.0)),
                                ]),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 60.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0))),
                                child: Center(
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(
                                        color:
                                            Color(int.parse(widget.item.color)),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                              ),
                            )
                          ]))
                    ]),
              ),
            )));
  }
}
