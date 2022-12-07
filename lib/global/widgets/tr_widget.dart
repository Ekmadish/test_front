import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:tasu/global/widgets/animated_switch.dart';

class TrWidget extends StatelessWidget {
  final int? number;
  final String trkey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final AlignmentGeometry? alignment;
  final int? maxLine;
  final bool softWrap;
  final TextOverflow? overflow;

  // ignore: prefer_const_constructors_in_immutables
  TrWidget({
    Key? key,
    required this.trkey,
    this.number,
    this.style,
    this.textAlign,
    this.maxLine,
    this.alignment,
    this.softWrap = true,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MainState state = MainState();

    return

        // ValueListenableBuilder(
        //   valueListenable: state.language,
        //   builder: (BuildContext context, val, child) {
        //     return

        Container(
      alignment: alignment,
      child: AnimatedSwitchWidget(
        child: number == null
            ? Text(
                key: ValueKey(trkey), // ValueKey(val.languageCode),
                trkey.i18n(),
                maxLines: maxLine,
                textAlign: textAlign,
                softWrap: softWrap,
                overflow: overflow,
                style: style)
            : Text(
                key: ValueKey(trkey), //ValueKey(val.languageCode),
                trkey.i18n([number.toString()]),
                maxLines: maxLine,
                textAlign: textAlign,
                softWrap: softWrap,
                overflow: overflow,
                style: style),
      ),
    );
    //   },
    // );
  }
}
