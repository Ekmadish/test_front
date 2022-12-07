import 'package:flutter/material.dart';

// class RowItemWidget extends StatelessWidget {
//   final String title;
//   const RowItemWidget({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Text(
//         title,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }

Widget rowItemWidget(String s, {int flex = 1}) => Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(right: 4, left: 2),
        child: Text(
          s,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
