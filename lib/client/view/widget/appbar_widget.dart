import 'package:flutter/material.dart';

AppBar appBar(Color colors) => AppBar(
      backgroundColor: colors,
    );

// class CAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final Color colors = Colors.transparent;
//   final String  title;
//   final double? height;
//   final List<Widget> widgets;
 

//   const CAppbar({Key? key,required  this.title, this.height, this.widgets})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: ,
//       title: title,
//       backgroundColor: backgroundColor,
//       actions: widgets,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
// }
