import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: 20,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
        webShowClose: true,
        timeInSecForIosWeb: 2
    );
  }
}
