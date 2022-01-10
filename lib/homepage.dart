// ignore: unused_import
// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool oTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  late int exScore;

  late int ohScore;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            // ignore: avoid_unnecessary_containers
            return GestureDetector(
                onTap: () {
                  tapped(index);
                },
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white38)),
                  child: Center(
                    child: Text(
                      displayXO[index],
                      style: const TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ));
          }),
    );
  }

  void tapped(int index) {
    setState(() {
      if (oTurn) {
        displayXO[index] = "X";
      } else {
        displayXO[index] = "O";
      }
      oTurn = !oTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    //check 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }
    //check 2nt row

    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      showWinDialog(displayXO[3]);
    }
    //check 3rd row

    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      showWinDialog(displayXO[6]);
    }
    //check 1st column

    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }
//check 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      showWinDialog(displayXO[1]);
    }
//check 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      showWinDialog(displayXO[2]);
    }
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      showWinDialog(displayXO[6]);
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      showWinDialog(displayXO[0]);
    }
  }

  void showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is: " + winner),
            actions: [
              FlatButton(
                child: Text("Play again"),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = ' ';
      }
    });
  }
}
