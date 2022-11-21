import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wordle/Data/KelimeModel.dart';

class AlertDialogWidget {
  void Descriptions(
      List<AnlamlarListe> aciklamalar, String title, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(const Radius.circular(15))),
          backgroundColor: Colors.grey[800],
          title: Text(
            "Aranan Kelime \"" + title + "\"",
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            width: 400,
            height: 120,
            child: ListView(
              shrinkWrap: true,
              children: aciklamalar.map((e) => aciklamaWidget(e)).toList(),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.green,
                      )),
                  child: Text(
                    'Tamam',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }

  Widget aciklamaWidget(AnlamlarListe e) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 0.3))),
      child: RichText(
        text: TextSpan(
          text: "Anlam " + e.anlamSira.toString() + " ) ",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: e.anlam.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
