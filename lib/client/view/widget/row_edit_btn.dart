import 'package:flutter/material.dart';
import 'package:tasu/client/constant/client_constant.dart';
import 'package:tasu/client/model/dialog_edit_model.dart';
import 'package:tasu/client/view/widget/addupdate_dialog_widget.dart';
import 'package:tasu/global/utils/utils.dart';

class RowEditButtonWidget extends StatelessWidget {
  final DialogEditModel editbody;
  final VoidCallback pressOkCallback;
  const RowEditButtonWidget({
    Key? key,
    required this.editbody,
    required this.pressOkCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                borderRadius: BorderRadius.circular(2),
                onTap: () {
                  Utils.showPopWiddow(context,
                      title: 'l_EditCompany',
                      body: AddUpdateDialogWidget(
                        body: editbody.body,
                        tabs: editbody.title,
                        color: ClientConstant.tabDestination[9].color,
                      ));
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.blueGrey,
                )),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
            InkWell(
                borderRadius: BorderRadius.circular(2),
                onTap: () async {
                  Utils.showAlertDialog(context,
                      content: 'Delete?',
                      title: 'u awnt delte it?',
                      onPressed: pressOkCallback);
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
