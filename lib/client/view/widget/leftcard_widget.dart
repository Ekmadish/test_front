import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class LeftCardWidget extends StatelessWidget {
  final String title;
  final List<String> items;
  final Function(int i) onTap;
  final int selectedIndex;
  const LeftCardWidget({
    Key? key,
    required this.items,
    required this.title,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var provider = context.read<Organization>();
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff181a1b),
          borderRadius: BorderRadius.circular(5),
        ),
        width: 332,
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 38,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                color: Color(0xff003600),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13),
              alignment: Alignment.centerLeft,
              child: Text(
                title.i18n(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Material(
                type: MaterialType.button,
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.doc,
                          color: Colors.white,
                          size: 19,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2)),
                        InkWell(
                          autofocus: false,
                          onTap: () => onTap(index),
                          // () {
                          //   provider.onSectionChange(index);
                          // },
                          child: Container(
                            decoration: index == selectedIndex
                                ? BoxDecoration(
                                    color: Colors.grey.shade600.withOpacity(.3),
                                    border: Border.all(
                                      color: Colors.white38,
                                    ))
                                : null,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: Text(
                              items[index].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
