import 'dart:async';
import 'dart:convert';
import 'dart:developer'; // ignore: unused_import
import 'dart:math';
import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wordle/Data/Data.dart';
import 'package:wordle/Data/Harf.dart';
import 'package:wordle/Data/KelimeModel.dart';
import 'package:wordle/Pages/HowToPlay.dart';
import 'package:wordle/Widgets/AlertDialog.dart';
import 'package:wordle/Widgets/ToastWidget.dart';

class MainPage extends StatefulWidget {
  bool sonuc = false;
  bool hata = false;
  Data data = Data();
  double angle = 0;
  List<Harf> kelime1 = [
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0)
  ];
  List<Harf> kelime2 = [
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0)
  ];
  List<Harf> kelime3 = [
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0)
  ];
  List<Harf> kelime4 = [
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0)
  ];
  List<Harf> kelime6 = [
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0)
  ];
  List<Harf> kelime5 = [
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0),
    Harf("", "emtpy", Colors.transparent, 0.0)
  ];

  List<KeyboardLetter> keyboardlayer1 = [
    KeyboardLetter("E", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("R", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("T", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("Y", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("U", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("I", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("O", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("P", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("Ğ", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("Ü", Color.fromARGB(255, 129, 131, 132)),
  ];
  List<KeyboardLetter> keyboardlayer2 = [
    KeyboardLetter("A", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("S", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("D", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("F", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("G", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("H", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("J", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("K", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("L", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("Ş", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("İ", Color.fromARGB(255, 129, 131, 132)),
  ];
  List<KeyboardLetter> keyboardlayer3 = [
    KeyboardLetter("Z", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("C", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("V", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("B", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("N", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("M", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("Ö", Color.fromARGB(255, 129, 131, 132)),
    KeyboardLetter("Ç", Color.fromARGB(255, 129, 131, 132)),
  ];

  int satir = 0, sutun = 0;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List gerekliList = [];

  Future<List<KelimeModel>> _getWord(String SearchWord) async {
    try {
      SearchWord = SearchWord.replaceAll("I", "ı");
      SearchWord = SearchWord.replaceAll("İ", "i");
      SearchWord = SearchWord.toLowerCase();
      final response = await Dio().get(
          'https://sozluk.gov.tr/gts?ara=' + SearchWord,
          options:
              Options(headers: {'Accept': 'application/json; charset=UTF-8'}));
      List<KelimeModel> wordList = [];
      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.data);
        wordList =
            (jsonObject as List).map((e) => KelimeModel.fromMap(e)).toList();
      }
      return wordList;
    } catch (e) {
      print(e.toString() + " HATA!!!!!!!!");
      widget.hata = true;

      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    widget.data.chooseWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 29, 36),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("Wordle Türkçe"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 23, 24, 31),
        actions: [
          Switch(
            value: hardMode!,
            onChanged: (value) {
              setState(() {
                hardMode = !hardMode!;
              });
            },
            activeTrackColor: Colors.green,
            activeColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (_, __, ___) => MainPage(),
                  ),
                );
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HowToPlay()));
              },
              icon: Icon(Icons.info_outline)),
        ],
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    widget.kelime1.map((veri) => HarfWidget(veri)).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    widget.kelime2.map((veri) => HarfWidget(veri)).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    widget.kelime3.map((veri) => HarfWidget(veri)).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    widget.kelime4.map((veri) => HarfWidget(veri)).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    widget.kelime5.map((veri) => HarfWidget(veri)).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    widget.kelime6.map((veri) => HarfWidget(veri)).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Keyboard(),
            ],
          ),
        ],
      )),
    );
  }

  Widget Keyboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.keyboardlayer1
              .map((veri) =>
                  KeyboardItem(veri, Data.getWidth(context) < 510 ? 3 : 6))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.keyboardlayer2
              .map((veri) => KeyboardItem(veri, 0))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                if (widget.sonuc == true) {
                  return;
                }
                if (widget.satir < 6) {
                  if (widget.sutun == 5) {
                    bool durum = await WordControl();
                    if (durum) {
                      HarfControl();

                      if (widget.satir == 6) {
                        widget.sonuc = true;
                      }
                      setState(() {});
                      if (widget.sonuc == true) {
                        var list = await _getWord(widget.data.kelime);

                        AlertDialogWidget().Descriptions(
                            list.first.anlamlarListe!,
                            widget.data.kelime,
                            context);
                      }
                    } else {
                      ToastWidget().showToast("Böyle Bir Kelime Yok!");
                    }
                  } else {
                    ToastWidget().showToast("Kelimenin Boyutu Yeterli Değil");
                  }
                } else {
                  ToastWidget().showToast("Haklarınız bitti");
                }
              },
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(1),
                height: Data.getWidth(context) < 510 ? 60 : 70,
                width: Data.getWidth(context) < 510 ? 46 : 70,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 129, 131, 132),
                    borderRadius: BorderRadius.all(Radius.circular(
                        Data.getWidth(context) < 510 ? 6 : 10))),
                child: Center(
                  child: Text(
                    "ENTER",
                    style: TextStyle(
                        fontSize: Data.getWidth(context) < 510 ? 12 : 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: widget.keyboardlayer3
                  .map((veri) => KeyboardItem(veri, 0))
                  .toList(),
            ),
            GestureDetector(
              onTap: () {
                if (widget.sutun > 0) {
                  if (widget.satir == 0) {
                    widget.sutun--;
                    widget.kelime1[widget.sutun].harf = "";
                  }
                  if (widget.satir == 1) {
                    widget.sutun--;
                    widget.kelime2[widget.sutun].harf = "";
                  }
                  if (widget.satir == 2) {
                    widget.sutun--;
                    widget.kelime3[widget.sutun].harf = "";
                  }
                  if (widget.satir == 3) {
                    widget.sutun--;
                    widget.kelime4[widget.sutun].harf = "";
                  }
                  if (widget.satir == 4) {
                    widget.sutun--;
                    widget.kelime5[widget.sutun].harf = "";
                  }
                  if (widget.satir == 5) {
                    widget.sutun--;
                    widget.kelime6[widget.sutun].harf = "";
                  }
                }
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(1),
                height: Data.getWidth(context) < 510 ? 60 : 70,
                width: Data.getWidth(context) < 510 ? 46 : 70,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 129, 131, 132),
                    borderRadius: BorderRadius.all(Radius.circular(
                        Data.getWidth(context) < 510 ? 6 : 10))),
                child: Center(
                  child: Icon(
                    Icons.backspace_outlined,
                    color: Colors.white,
                    size: Data.getWidth(context) < 510 ? 18 : 25,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget KeyboardItem(KeyboardLetter keyboardLetter, double add) {
    return GestureDetector(
      onTap: () {
        if (widget.sonuc == false) {
          OnClickFunc(keyboardLetter.harf);
        }
      },
      child: Container(
        margin: EdgeInsets.all(2),
        height: Data.getWidth(context) < 510 ? 60 : 70,
        width: Data.getWidth(context) < 510 ? (30 + add) : (40 + add),
        decoration: BoxDecoration(
            color: keyboardLetter.color,
            borderRadius: BorderRadius.all(
                Radius.circular(Data.getWidth(context) < 510 ? 4 : 10))),
        child: Center(
          child: Text(
            keyboardLetter.harf,
            style: TextStyle(
                fontSize: Data.getWidth(context) < 510 ? 12 : 16,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget HarfWidget(Harf harf) {
    return AnimatedRotation(
      duration: Duration(seconds: 1),
      turns: harf.angle,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.all(5),
        height: Data.getWidth(context) < 510 ? 58 : 63,
        width: Data.getWidth(context) < 510 ? 58 : 63,
        decoration: BoxDecoration(
            color: harf.color,
            border: Border.all(
                color: harf.color == Colors.transparent
                    ? Colors.grey
                    : harf.color!,
                width: Data.getWidth(context) < 510 ? 1 : 3),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            harf.harf,
            style: TextStyle(
                fontSize: Data.getWidth(context) < 510 ? 20 : 40,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  void OnClickFunc(String harf) {
    if (widget.sutun < 6) {
      if (widget.satir == 0) {
        widget.kelime1[widget.sutun].harf = harf;
        widget.sutun++;
      }
      if (widget.satir == 1) {
        widget.kelime2[widget.sutun].harf = harf;
        widget.sutun++;
      }
      if (widget.satir == 2) {
        widget.kelime3[widget.sutun].harf = harf;
        widget.sutun++;
      }
      if (widget.satir == 3) {
        widget.kelime4[widget.sutun].harf = harf;
        widget.sutun++;
      }
      if (widget.satir == 4) {
        widget.kelime5[widget.sutun].harf = harf;
        widget.sutun++;
      }
      if (widget.satir == 5) {
        widget.kelime6[widget.sutun].harf = harf;
        widget.sutun++;
      }
    }

    setState(() {});
  }

  Future<bool> WordControl() async {
    List<Harf> listTemp = [];
    if (widget.satir == 0) {
      listTemp = widget.kelime1;
    } else if (widget.satir == 1) {
      listTemp = widget.kelime2;
    } else if (widget.satir == 2) {
      listTemp = widget.kelime3;
    } else if (widget.satir == 3) {
      listTemp = widget.kelime4;
    } else if (widget.satir == 4) {
      listTemp = widget.kelime5;
    } else {
      listTemp = widget.kelime6;
    }
    String word = "";
    for (var i = 0; i < listTemp.length; i++) {
      word += listTemp[i].harf;
    }
    print(word);
    widget.hata = false;
    var list = await _getWord(word);
    print(list.toString());
    if (widget.hata == true) {
      widget.hata = false;
      return false;
    } else {
      widget.hata = false;
      return true;
    }
  }

  void HarfControl() {
    int index = 0;
    bool kontrol = true;
    String kelimeTemp = widget.data.kelime;
    List<Harf> listTemp = [];
    List tahmin = [];
    if (widget.satir == 0) {
      listTemp = widget.kelime1;
    } else if (widget.satir == 1) {
      listTemp = widget.kelime2;
    } else if (widget.satir == 2) {
      listTemp = widget.kelime3;
    } else if (widget.satir == 3) {
      listTemp = widget.kelime4;
    } else if (widget.satir == 4) {
      listTemp = widget.kelime5;
    } else {
      listTemp = widget.kelime6;
    }

    for (var i = 0; i < listTemp.length; i++) {
      tahmin.add(listTemp[i].harf);
    }

    if (hardMode! && widget.satir > 0 && gerekliList.isNotEmpty) {
      for (String data in gerekliList) {
        if (!tahmin.contains(data)) {
          kontrol = false;
          break;
        }
        index++;
      }
    }

    if (kontrol) {
      for (var i = 0; i < listTemp.length; i++) {
        if (kelimeTemp.contains(listTemp[i].harf)) {
          if (widget.data.kelime[i] == listTemp[i].harf) {
            listTemp[i].color = Colors.green;
            if (!gerekliList.contains(listTemp[i].harf))
              gerekliList.add(listTemp[i].harf);

            kelimeTemp = kelimeTemp.replaceFirst(listTemp[i].harf, "");
          } else {
            if (widget.data
                        .kelime[widget.data.kelime.indexOf(listTemp[i].harf)] ==
                    listTemp[widget.data.kelime.indexOf(listTemp[i].harf)]
                        .harf &&
                widget.data.kelime[
                        widget.data.kelime.lastIndexOf(listTemp[i].harf)] ==
                    listTemp[widget.data.kelime.lastIndexOf(listTemp[i].harf)]
                        .harf) {
              print(widget
                  .data.kelime[widget.data.kelime.indexOf(listTemp[i].harf)]);
              print(
                  listTemp[widget.data.kelime.indexOf(listTemp[i].harf)].harf);
              print(widget.data
                  .kelime[widget.data.kelime.lastIndexOf(listTemp[i].harf)]);
              print(listTemp[widget.data.kelime.lastIndexOf(listTemp[i].harf)]
                  .harf);
              print(widget.data.kelime.lastIndexOf(listTemp[i].harf));
              listTemp[i].color = Colors.grey[800];
            } else {
              listTemp[i].color = Colors.orange;
              if (!gerekliList.contains(listTemp[i].harf))
                gerekliList.add(listTemp[i].harf);
              kelimeTemp = kelimeTemp.replaceFirst(listTemp[i].harf, "");
            }
          }
        } else {
          listTemp[i].color = Colors.grey[800];
          kelimeTemp = kelimeTemp.replaceFirst(listTemp[i].harf, "");
        }
      }
    } else
      ToastWidget().showToast("Tahmin şunu içermeli : " + gerekliList[index]);

    if (kontrol) {
      bool drm = true;
      for (var i = 0; i < listTemp.length; i++) {
        if (listTemp[i].color != Colors.green) {
          drm = false;
        }
      }

      if (drm == true) {
        widget.sonuc = true;
        ToastWidget().showToast("Tebrikler Kelimeyi Buldunuz");
      }
//Klavye rengi belirleme
      for (var i = 0; i < listTemp.length; i++) {
        for (var j = 0; j < widget.keyboardlayer1.length; j++) {
          if (listTemp[i].harf == widget.keyboardlayer1[j].harf) {
            if (widget.keyboardlayer1[j].color == Colors.green) {
              widget.keyboardlayer1[j].color = Colors.green;
            } else if (widget.keyboardlayer1[j].color == Colors.orange) {
              if (listTemp[i].color == Colors.green) {
                widget.keyboardlayer1[j].color = Colors.green;
              }
            } else {
              widget.keyboardlayer1[j].color = listTemp[i].color;
            }
          }
        }
      }

      for (var i = 0; i < listTemp.length; i++) {
        for (var j = 0; j < widget.keyboardlayer2.length; j++) {
          if (listTemp[i].harf == widget.keyboardlayer2[j].harf) {
            if (widget.keyboardlayer2[j].color == Colors.green) {
              widget.keyboardlayer2[j].color = Colors.green;
            } else if (widget.keyboardlayer2[j].color == Colors.orange) {
              if (listTemp[i].color == Colors.green) {
                widget.keyboardlayer2[j].color = Colors.green;
              }
            } else {
              widget.keyboardlayer2[j].color = listTemp[i].color;
            }
          }
        }
      }

      for (var i = 0; i < listTemp.length; i++) {
        for (var j = 0; j < widget.keyboardlayer3.length; j++) {
          if (listTemp[i].harf == widget.keyboardlayer3[j].harf) {
            if (widget.keyboardlayer3[j].color == Colors.green) {
              widget.keyboardlayer3[j].color = Colors.green;
            } else if (widget.keyboardlayer3[j].color == Colors.orange) {
              if (listTemp[i].color == Colors.green) {
                widget.keyboardlayer3[j].color = Colors.green;
              }
            } else {
              widget.keyboardlayer3[j].color = listTemp[i].color;
            }
          }
        }
      }

      for (var i = 0; i < listTemp.length; i++) {
        listTemp[i].angle += 1.0;
      }
      Future.delayed(Duration(seconds: 2)).whenComplete(() {
        setState(() {});
      });
      widget.satir++;
      widget.sutun = 0;
    }
  }
}
