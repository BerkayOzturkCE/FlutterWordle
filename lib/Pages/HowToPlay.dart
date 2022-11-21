import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html';

class HowToPlay extends StatefulWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  _HowToPlayState createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(50, 255, 255, 255),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: 500,
          padding: EdgeInsets.symmetric(vertical: 36, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text("NASIL OYNANIR ?",
                    style: GoogleFonts.mulish(
                        fontSize: 32, fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Doğru kelimeyi 6 tahminde bulmayı deneyin\n\n"
                  "Her tahmin geçerli bir kelime ve 5 harfli olmalıdır\n\n"
                  "Her tahminden sonra, karelerin rengi, tahmininizin kelimeye ne kadar "
                  "yakın olduğuna göre değişecektir",
                  style: GoogleFonts.mulish(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "A",
                        style: GoogleFonts.mulish(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Text("A harfi kelimede bulunmuyor.",
                        style: GoogleFonts.mulish(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE9F10),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "A",
                        style: GoogleFonts.mulish(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                      child: Text(
                          "A harfi kelimede bulunuyor ama yeri doğru değil.",
                          style: GoogleFonts.mulish(
                              fontSize: 15, fontWeight: FontWeight.w600))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF21BC5F),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "A",
                        style: GoogleFonts.mulish(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Text("A harfi kelimede var ve yeri doğru.",
                          style: GoogleFonts.mulish(
                              fontSize: 15, fontWeight: FontWeight.w600))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
