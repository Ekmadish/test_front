import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localization/localization.dart';
import 'package:tasu/global/widgets/widgets.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class NoAnimationTabController extends TabController {
  NoAnimationTabController(
      {int initialIndex = 0,
      required int length,
      required TickerProvider vsync})
      : super(initialIndex: initialIndex, length: length, vsync: vsync);

  @override
  void animateTo(int value, {Duration? duration, Curve curve = Curves.ease}) {
    super.animateTo(value, duration: Duration.zero, curve: curve);
  }
}

class Utils {
  Utils._();
  static final Utils _u = Utils._();
  factory Utils() => _u;

  String _url(int phone) {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone/?text=Hello";
    } else {
      return "https://api.whatsapp.com/send?phone=$phone=Hello";
    }
  }

  static void toast(String str, {ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: str.i18n(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black26,
        textColor: Colors.black87,
        fontSize: 17.0);
  }

  static Future<void> showAlertDialog(BuildContext context,
      {required String title,
      required String content,
      required VoidCallback onPressed}) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: onPressed, child: Text('l_Yes'.i18n())),
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blueAccent,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'l_No'.i18n(),
                style: const TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  static Future<void> showPopWiddow(BuildContext context,
      {required Widget body, required String title}) async {
    return await showDialog(
      context: context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        animationDuration: Duration.zero,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            primary: true,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xff181a1b),
                    border: Border.all(
                      color: const Color(0xff736b5e),
                    )),
                width: 1000,
                height: 600,
                child: Column(
                  children: [
                    Material(
                      child: Container(
                          height: 31,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white54,
                                width: .4,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.white),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  title.i18n(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Btn(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white54,
                                  ))
                            ],
                          )),
                    ),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: body)),
                  ],
                )),
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: true,
    );
  }
}
