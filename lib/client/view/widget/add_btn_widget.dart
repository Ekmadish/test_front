import 'package:flutter/material.dart';

class AddWidget extends StatelessWidget {
  final Function() onPresse;
  const AddWidget({Key? key, required this.onPresse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff26292b),
          border: Border.all(color: Colors.white12)),
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: const Color(0xff606060),
        ),
        padding: const EdgeInsets.all(0),
        child: TextButton.icon(
            autofocus: false,
            style: ButtonStyle(
              alignment: Alignment.center,
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28))),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 3, vertical: 3)),
            ),
            onPressed: onPresse,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Padding(
              padding: EdgeInsets.only(bottom: 3, right: 4),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
    );
  }
}
