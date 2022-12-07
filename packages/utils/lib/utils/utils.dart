import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:utils/utils/cupertinbtn_widget.dart';

class Utils {
  Utils._();
  static final Utils _u = Utils._();
  factory Utils() => _u;

  static List<List<T>> splitList<T>(List<T> list, int len) {
    if (len <= 1) {
      return [list];
    }

    List<List<T>> result = [];
    int index = 1;

    while (true) {
      if (index * len < list.length) {
        List<T> temp = list.skip((index - 1) * len).take(len).toList();
        result.add(temp);
        index++;
        continue;
      }
      List<T> temp = list.skip((index - 1) * len).toList();
      result.add(temp);
      break;
    }
    return result;
  }

  static void _showAlertDialog(BuildContext context,
      {title = "", @required message, OKCallback}) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        if (OKCallback != null) OKCallback();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title ?? "",
          style: const TextStyle(fontSize: 22, color: Colors.black)),
      content: Text(message ?? "",
          style: const TextStyle(fontSize: 18, color: Colors.black87)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAlertContinueAndCancelDialog(BuildContext context,
      {title = "",
      @required message,
      @required ContinueCallback,
      @required CancelCallback}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "Болдырмау",
        style: TextStyle(color: Colors.black45),
      ),
      onPressed: () {
        if (CancelCallback != null) {
          CancelCallback();
        }
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Жалғастыру"),
      onPressed: () {
        if (ContinueCallback != null) ContinueCallback();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title ?? "",
          style: const TextStyle(fontSize: 22, color: Colors.black)),
      content: Text(
        message ?? "",
        style: const TextStyle(fontSize: 18, color: Colors.black87),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAuthDioalog(BuildContext context,
      {title = "",
      @required message,
      @required ContinueCallback,
      @required CancelCallback}) {
    // set up the buttons
    // Widget cancelButton = TextButton(
    //   child:  Text(
    //     "Болдырмау",
    //     style: TextStyle(color: Colors.black45),
    //   ),
    //   onPressed: () {
    //     if (CancelCallback != null) {
    //       CancelCallback();
    //     }
    //     Navigator.of(context).pop();
    //   },
    // );
    Widget continueButton = Center(
        child: TextButton(
      child: const Text("Жалғастыру"),
      onPressed: () {
        ContinueCallback != null
            ? ContinueCallback()
            : Navigator.of(context).pop();
      },
    ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, color: Colors.black)),
      content: Text(
        message ?? "",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.black87),
      ),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: child,
    );
  }

  static void copiedClipBoardToast(text) {
    if (!text || text == "" || text == null) return;
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      fontSize: 30.0,
    );
  }

  static void WebViewCheckInputFile(
      BuildContext context, String url, String title,
      {iOShideAppBar = false, androidHideAppBar = false, goHomePage = false}) {
    if (Platform.isAndroid) {
      // Android-specific code
      // NavigatorUtil.push(
      //     context,
      //     WebViewInputFile(
      //       url: url,
      //       statusBarColor: null,
      //       hideAppBar: androidHideAppBar,
      //       title: title ?? "Inexport",
      //       goHomePage: goHomePage,
      //     ));
    } else {
      // NavigatorUtil.push(
      //     context,
      //     WebViewCustom(
      //       url: url,
      //       statusBarColor: null,
      //       hideAppBar: iOShideAppBar,
      //       title: title ?? "Inexport",
      //       goHomePage: goHomePage,
      //     ));
    }
  }

  /// Define a top-level named handler which background/terminated messages will
  /// call.
  ///
  /// To verify things are working, check out the native platform logs.

  //////////////////////////////////////////////////

  showAlertDialog(BuildContext context,
          {title = "", @required message, OKCallback}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                actions: [
                  Center(
                    child: Btn(
                      text: '',
                      child: Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xff9D7EF3)),
                          child: const Text("OK")),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (OKCallback != null) OKCallback();
                      },
                    ),
                  )
                ],
                title: Text(title ?? "",
                    style: const TextStyle(fontSize: 18, color: Colors.black87)),
                content: Text(message ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.black87)),
              ));
  //////////////////////////////////////////////////
  var _digit;
  // void whatsAppLounch(String phone) {
  //   _digit = int.tryParse(phone.replaceAll(RegExp(r'[^0-9]'), ''));
  //   if (_digit != null) {
  //     launchUrls(Uri.parse(_url(_digit)));
  //     log(_url(_digit));
  //   } else {
  //     toast('Сәтсіз', gravity: ToastGravity.BOTTOM);
  //   }
  // }

  String _url(int phone) {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone/?text=Hello";
    } else {
      return "https://api.whatsapp.com/send?phone=$phone=Hello";
    }
  }

  // void phoneCall(String url) async {
  //   if (!await launchUrl(Uri(scheme: 'tel', path: url))) {
  //     toast('Сәтсіз', gravity: ToastGravity.BOTTOM);
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> launchUrls(Uri url) async {
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.externalNonBrowserApplication,
  //   )) {
  //     toast('Сәтсіз', gravity: ToastGravity.BOTTOM);

  //     throw 'Could not launch $url';
  //   }
  // }
  //////////////////////////////////////////////////

  static void toast(String str, {ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black26,
        textColor: Colors.black87,
        fontSize: 17.0);
  }
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////
}
