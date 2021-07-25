import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_app_ui/model/list_item.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    this._controller.addListener(() {
      _selectCategoryIndex();
    });
    super.initState();
  }

  _selectCategoryIndex() {
    Timer(Duration(milliseconds: 400), () {
      double newIndex = _controller.offset / 210;
      if (newIndex.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex.round();
        });
      }
    });
  }

  _scrollToItem(index) {
    double position = index * 210;

    _controller.animateTo(position,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_listCategory(), _fruitShow()],
    );
  }

  Widget _listCategory() {
    return Container(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });

                _scrollToItem(_selectedIndex);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                        style: _selectedIndex == index
                            ? BorderStyle.solid
                            : BorderStyle.none),
                  )),
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(
                    listItems[index].name,
                    style: TextStyle(
                        color: _selectedIndex == index
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _fruitShow() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listItems.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            width: 210,
            decoration: BoxDecoration(
              color: Color(int.parse(listItems[index].color)),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10.0,
                    offset: Offset(0, 30),
                    color: Color(int.parse(listItems[index].color))
                        .withOpacity(0.6),
                    spreadRadius: -20)
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listItems[index].name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: listItems[index].price + ".00",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: " (" + listItems[index].kg + ")")
                        ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}