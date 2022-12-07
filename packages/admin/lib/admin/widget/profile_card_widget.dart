import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 16 / 2,
      // ),
      decoration: BoxDecoration(
        // color: Color(0xFF2A2D3E),
        color: Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: const ListTile(
        leading: Icon(Icons.person),
        title: Text('demo person name'),
      ),
    );
  }
}
