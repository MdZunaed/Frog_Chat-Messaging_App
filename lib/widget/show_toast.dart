import 'package:fluttertoast/fluttertoast.dart';
import 'package:frog_chat/style.dart';

class toast {
  void toastmessage(String msg) {
    Fluttertoast.showToast(
        msg: msg, textColor: kDarkColor, backgroundColor: kPrimaryColor);
  }
}
