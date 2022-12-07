import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/client/model/dialog_edit_model.dart';
import 'package:tasu/client/view/widget/row_edit_btn.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/widgets.dart';

class EmployeesGroupScreen extends StatelessWidget {
  const EmployeesGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientRepository r = ClientRepository();
    return FutureBuilderWidget(
      future: r.employeeList(),
      whenDone: (snapshotData) => BodyWidget(
        itemCount: snapshotData.total!,
        columnName: const [ColumBuilder(name: 'Group name')],
        itemBuilder: (context, index) {
          var data = snapshotData.dataList![index];
          return Container(
            height: 39,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff363a3d))),
            // padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowItemWidget(
                  data.name ?? 'null',
                ),
                RowEditButtonWidget(
                  editbody: DialogEditModel(
                    body: [
                      Container(
                        color: Colors.amber,
                      ),
                      Container(
                        color: Colors.red,
                      ),
                    ],
                    title: const ['ok', 'test'],
                  ),
                  pressOkCallback: () {},
                ),
              ],
            ),
          );
        },
      ),
      whenError: (error) => const Center(
        child: Text('data'),
      ),
    );
  }
}
