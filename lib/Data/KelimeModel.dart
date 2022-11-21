// To parse this JSON data, do
//
//     final kelimeModel = kelimeModelFromMap(jsonString);

import 'dart:convert';

KelimeModel kelimeModelFromMap(String str) =>
    KelimeModel.fromMap(json.decode(str));

String kelimeModelToMap(KelimeModel data) => json.encode(data.toMap());

class KelimeModel {
  KelimeModel({
    this.maddeId,
    this.kac,
    this.kelimeNo,
    this.cesit,
    this.anlamGor,
    this.onTaki,
    this.madde,
    this.cesitSay,
    this.anlamSay,
    this.taki,
    this.cogulMu,
    this.ozelMi,
    this.lisanKodu,
    this.lisan,
    this.telaffuz,
    this.birlesikler,
    this.font,
    this.maddeDuz,
    this.gosterimTarihi,
    this.anlamlarListe,
    //this.atasozu,
  });

  final String? maddeId;
  final String? kac;
  final String? kelimeNo;
  final String? cesit;
  final String? anlamGor;
  final dynamic onTaki;
  final String? madde;
  final String? cesitSay;
  final String? anlamSay;
  final dynamic taki;
  final String? cogulMu;
  final String? ozelMi;
  final String? lisanKodu;
  final String? lisan;
  final dynamic telaffuz;
  final String? birlesikler;
  final dynamic font;
  final String? maddeDuz;
  final dynamic gosterimTarihi;
  final List<AnlamlarListe>? anlamlarListe;
  //final List<Atasozu>? atasozu;

  factory KelimeModel.fromMap(Map<String, dynamic> json) => KelimeModel(
        maddeId: json["madde_id"],
        kac: json["kac"],
        kelimeNo: json["kelime_no"],
        cesit: json["cesit"],
        anlamGor: json["anlam_gor"],
        onTaki: json["on_taki"],
        madde: json["madde"],
        cesitSay: json["cesit_say"],
        anlamSay: json["anlam_say"],
        taki: json["taki"],
        cogulMu: json["cogul_mu"],
        ozelMi: json["ozel_mi"],
        lisanKodu: json["lisan_kodu"],
        lisan: json["lisan"],
        telaffuz: json["telaffuz"],
        birlesikler: json["birlesikler"],
        font: json["font"],
        maddeDuz: json["madde_duz"],
        gosterimTarihi: json["gosterim_tarihi"],
        anlamlarListe: List<AnlamlarListe>.from(
            json["anlamlarListe"].map((x) => AnlamlarListe.fromMap(x))),
        // atasozu:List<Atasozu>.from(json["atasozu"].map((x) => Atasozu.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "madde_id": maddeId,
        "kac": kac,
        "kelime_no": kelimeNo,
        "cesit": cesit,
        "anlam_gor": anlamGor,
        "on_taki": onTaki,
        "madde": madde,
        "cesit_say": cesitSay,
        "anlam_say": anlamSay,
        "taki": taki,
        "cogul_mu": cogulMu,
        "ozel_mi": ozelMi,
        "lisan_kodu": lisanKodu,
        "lisan": lisan,
        "telaffuz": telaffuz,
        "birlesikler": birlesikler,
        "font": font,
        "madde_duz": maddeDuz,
        "gosterim_tarihi": gosterimTarihi,
        "anlamlarListe":
            List<dynamic>.from(anlamlarListe!.map((x) => x.toMap())),
        // "atasozu": List<dynamic>.from(atasozu!.map((x) => x.toMap())),
      };
}

class AnlamlarListe {
  AnlamlarListe({
    this.anlamId,
    this.maddeId,
    this.anlamSira,
    this.fiil,
    this.tipkes,
    this.anlam,
    this.gos,
    this.ozelliklerListe,
    this.orneklerListe,
  });

  final String? anlamId;
  final String? maddeId;
  final String? anlamSira;
  final String? fiil;
  final String? tipkes;
  final String? anlam;
  final String? gos;
  final List<OzelliklerListe>? ozelliklerListe;
  final List<OrneklerListe>? orneklerListe;

  factory AnlamlarListe.fromMap(Map<String, dynamic> json) => AnlamlarListe(
        anlamId: json["anlam_id"],
        maddeId: json["madde_id"],
        anlamSira: json["anlam_sira"],
        fiil: json["fiil"],
        tipkes: json["tipkes"],
        anlam: json["anlam"],
        gos: json["gos"],
        ozelliklerListe: json["ozelliklerListe"] == null
            ? null
            : List<OzelliklerListe>.from(
                json["ozelliklerListe"].map((x) => OzelliklerListe.fromMap(x))),
        orneklerListe: json["orneklerListe"] == null
            ? null
            : List<OrneklerListe>.from(
                json["orneklerListe"].map((x) => OrneklerListe.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "anlam_id": anlamId,
        "madde_id": maddeId,
        "anlam_sira": anlamSira,
        "fiil": fiil,
        "tipkes": tipkes,
        "anlam": anlam,
        "gos": gos,
        "ozelliklerListe": ozelliklerListe == null
            ? null
            : List<dynamic>.from(ozelliklerListe!.map((x) => x.toMap())),
        "orneklerListe": orneklerListe == null
            ? null
            : List<dynamic>.from(orneklerListe!.map((x) => x.toMap())),
      };
}

class OrneklerListe {
  OrneklerListe({
    this.ornekId,
    this.anlamId,
    this.ornekSira,
    this.ornek,
    this.kac,
    this.yazarId,
    this.yazar,
  });

  final String? ornekId;
  final String? anlamId;
  final String? ornekSira;
  final String? ornek;
  final String? kac;
  final String? yazarId;
  final List<Yazar>? yazar;

  factory OrneklerListe.fromMap(Map<String, dynamic> json) => OrneklerListe(
        ornekId: json["ornek_id"],
        anlamId: json["anlam_id"],
        ornekSira: json["ornek_sira"],
        ornek: json["ornek"],
        kac: json["kac"],
        yazarId: json["yazar_id"],
        yazar: json["yazar"] == null
            ? null
            : List<Yazar>.from(json["yazar"].map((x) => Yazar.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "ornek_id": ornekId,
        "anlam_id": anlamId,
        "ornek_sira": ornekSira,
        "ornek": ornek,
        "kac": kac,
        "yazar_id": yazarId,
        "yazar": yazar == null
            ? null
            : List<dynamic>.from(yazar!.map((x) => x.toMap())),
      };
}

class Yazar {
  Yazar({
    this.yazarId,
    this.tamAdi,
    this.kisaAdi,
    this.ekno,
  });

  final String? yazarId;
  final String? tamAdi;
  final String? kisaAdi;
  final String? ekno;

  factory Yazar.fromMap(Map<String, dynamic> json) => Yazar(
        yazarId: json["yazar_id"],
        tamAdi: json["tam_adi"],
        kisaAdi: json["kisa_adi"],
        ekno: json["ekno"],
      );

  Map<String, dynamic> toMap() => {
        "yazar_id": yazarId,
        "tam_adi": tamAdi,
        "kisa_adi": kisaAdi,
        "ekno": ekno,
      };
}

class OzelliklerListe {
  OzelliklerListe({
    this.ozellikId,
    this.tur,
    this.tamAdi,
    this.kisaAdi,
    this.ekno,
  });

  final String? ozellikId;
  final String? tur;
  final String? tamAdi;
  final String? kisaAdi;
  final String? ekno;

  factory OzelliklerListe.fromMap(Map<String, dynamic> json) => OzelliklerListe(
        ozellikId: json["ozellik_id"],
        tur: json["tur"],
        tamAdi: json["tam_adi"],
        kisaAdi: json["kisa_adi"],
        ekno: json["ekno"],
      );

  Map<String, dynamic> toMap() => {
        "ozellik_id": ozellikId,
        "tur": tur,
        "tam_adi": tamAdi,
        "kisa_adi": kisaAdi,
        "ekno": ekno,
      };
}

class Atasozu {
  Atasozu({
    this.maddeId,
    this.madde,
    this.onTaki,
  });

  final String? maddeId;
  final String? madde;
  final dynamic onTaki;

  factory Atasozu.fromMap(Map<String, dynamic> json) => Atasozu(
        maddeId: json["madde_id"],
        madde: json["madde"],
        onTaki: json["on_taki"],
      );

  Map<String, dynamic> toMap() => {
        "madde_id": maddeId,
        "madde": madde,
        "on_taki": onTaki,
      };
}
