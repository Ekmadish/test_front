import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class TabbarWidget extends StatelessWidget {
  final String routerName;
  final Color colors;
  final List<String> tabs;
  final Function(String routerName) onTap;
  const TabbarWidget(
      {Key? key,
      required this.routerName,
      required this.colors,
      required this.tabs,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: colors,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: tabs
            .map((e) => InkWell(
                  onTap: () {
                    onTap(e);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: e == routerName
                          ? const Color(0xff5f1aa2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: e == routerName
                          ? Border.all(
                              color: const Color.fromARGB(136, 47, 42, 42),
                              width: 2)
                          : const Border(),
                      boxShadow: e == routerName
                          ? <BoxShadow>[
                              const BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 30.0,
                                  offset: Offset(0.0, 0.5))
                            ]
                          : [],
                    ),
                    child: Text(
                      e.i18n(),
                      // .capitalize()
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
