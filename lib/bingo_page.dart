import 'dart:math';

import 'package:flutter/material.dart';

import 'Models/card.dart';

class BingoPage extends StatefulWidget {
  var bingoNumber = 0;
  var cinko = 1;

  BingoCard bingoCard;
  BingoPage({Key key, @required this.bingoCard}) : super(key: key);

  @override
  _BingoPageState createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children:
                        widget.bingoCard.cardArray[2].map<Widget>((title) {
                      if (title != 0) {
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              if (title == widget.bingoNumber) {
                                numberControl(title, 2);
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width / 5,
                                color: Colors.greenAccent[100],
                                child: Center(child: Text(title.toString()))),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width / 5,
                              color: widget.bingoCard.cardColor,
                              child: Text(" ")),
                        );
                      }
                    }).toList(),
                  ),
                  Column(
                    children:
                        widget.bingoCard.cardArray[1].map<Widget>((title) {
                      if (title != 0) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              if (title == widget.bingoNumber) {
                                numberControl(title, 1);
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width / 5,
                                color: Colors.greenAccent[100],
                                child: Center(child: Text(title.toString()))),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width / 5,
                              color: widget.bingoCard.cardColor,
                              child: Text(" ")),
                        );
                      }
                    }).toList(),
                  ),
                  Column(
                    children:
                        widget.bingoCard.cardArray[0].map<Widget>((title) {
                      if (title != 0) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: (){
                              if(title == widget.bingoNumber){
                                numberControl(title,0);
                              }
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width / 5,
                                color: Colors.greenAccent[100],
                                child: Center(child: Text(title.toString()))),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width / 5,
                              color: widget.bingoCard.cardColor,
                              child: Text(" ")),
                        );
                      }
                    }).toList(),
                  )
                ],
              )),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      getNewNumber();
                    },
                    child: Text("Sayı Al")),
                Container(
                  child:
                      Text("Şu anki numara: " + widget.bingoNumber.toString()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void numberControl(title, arrnum) {
    for (int i = 0; i < widget.bingoCard.cardArray[arrnum].length; i++) {
      if (title == widget.bingoCard.cardArray[arrnum][i]) {
        widget.bingoCard.cardArray[arrnum][i] = 0;
      }
    }
    setState(() {});
    if(cinkoControl(arrnum)){
      _showDialog(widget.cinko.toString() + ". çinko!");
      if(widget.cinko == 3){
        _showDialog("Tebrikler! Oyun bitti");

      }
      widget.cinko++;

    }
  }
  void _showDialog(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
          );
        });
  }
  void getNewNumber() {
    var rng = new Random();
    widget.bingoNumber = rng.nextInt(90);
    setState(() {});
  }

  bool cinkoControl(arrnum) {
    for(int i=0;i<widget.bingoCard.cardArray[arrnum].length; i++){
      if (widget.bingoCard.cardArray[arrnum][i] != 0 ) {
        return false;
      }
    }
    return true;
  }
}
