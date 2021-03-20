import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Models/card.dart';
import 'bingo_page.dart';

class CardChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tombala"),
      ),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      var card = BingoCard("Kart 1", Colors.pinkAccent, [
                        [0, 12, 24, 0, 42, 0, 63, 0, 81],
                        [6, 0, 29, 0, 44, 57, 0, 70, 0],
                        [0, 19, 0, 32, 0, 0, 64, 76, 82]
                      ]);
                      cardChosen(card, context);
                    },
                    child: Transform.rotate(
                      angle: 76.97,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                          "assets/kart/kart001.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 76.97,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset("assets/kart/kart002.png"),
                    ),
                  ),
                  Transform.rotate(
                    angle: 76.97,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset("assets/kart/kart003.png"),
                    ),
                  )
                ],
              )),
          Text("Kart Seçin")
        ],
      ),
    );
  }

  void cardChosen(BingoCard card, context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            // ignore: deprecated_member_use
            builder: (context) => BingoPage(
                  bingoCard: card,
                )));
  }
}
