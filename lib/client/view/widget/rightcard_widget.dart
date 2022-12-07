import 'package:flutter/material.dart';

class RightCardWidget extends StatelessWidget {
  final Widget? filterwidget;
  final Widget body;
  final String title;
  const RightCardWidget({
    Key? key,
    required this.body,
    required this.title,
    this.filterwidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 38,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                color: Color(0xff003600),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13),
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            filterwidget ?? const SizedBox(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.topCenter,
              // height: 400,
              decoration: const BoxDecoration(
                color: Color(0xff181a1b),
                // borderRadius: BorderRadius.circular(5),
              ),
              child: body,
            ),
          ],
        ));
  }
}
