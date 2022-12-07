import 'package:flutter/material.dart';
import 'package:tasu/global/widgets/textfileds_widget.dart';
import 'package:tasu/global/widgets/tr_widget.dart';

class HeadrWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback clearCall;
  final VoidCallback? addPressed;
  final  Widget   deletebtn;
  const HeadrWidget({
    Key? key,
    required this.clearCall,
    required this.onChanged,
    required this.addPressed,
    required this.deletebtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SearchingTextField(
              onChanged: onChanged,
              clearCall: clearCall,
            ),
          ),
         deletebtn ,
          SizedBox(
            height: 44,
            child: TextButton.icon(
                onPressed: addPressed,
                icon: const Icon(Icons.add),
                label: TrWidget(
                  trkey: 'l_NewAdd',
                  alignment: Alignment.centerLeft,
                  // style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
