import 'package:flutter/material.dart';
import 'package:tasu/global/widgets/tr_widget.dart';

class HeadrColumWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final TextStyle? textStyle;
  final Function()? onTap;
  final Function()? onLongPress;

  final bool? ascending;

  const HeadrColumWidget({
    Key? key,
    required this.color,
    this.text,
    this.textStyle,
    this.onTap,
    required this.ascending,
    // this.onSort,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black12, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TrWidget(
                    trkey: text ?? '',
                    style: textStyle ?? const TextStyle(fontSize: 16.0),
                    softWrap: true,
                  ),
                ),
              ),
              ascending != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                          ascending! ? Icons.expand_more : Icons.expand_less),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
