import 'package:flutter/material.dart';
import 'package:tasu/client/constant/client_constant.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/model/models.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/client/model/dialog_edit_model.dart';
import 'package:tasu/client/view/widget/addupdate_dialog_widget.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/utils/utils.dart';
import 'package:tasu/global/widgets/widgets.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientRepository r = ClientRepository();
    return FutureBuilderWidget<DepartmentModel>(
      future: r.departmentList(),
      whenDone: (snapshotData) => BodyWidget(
        columnName: _item,
        itemBuilder: (context, index) {
          var data = snapshotData.dataList[index];

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
                    title: ['ok', 'test'],
                  ),
                  pressOkCallback: () {},
                ),
              ],
            ),
          );
        },
        itemCount: snapshotData.total,
      ),
      whenError: (error) => const Center(
        child: Text('data'),
      ),
    );
  }
}

List<ColumBuilder> _item = const [
  ColumBuilder(
    name: 'Company name',
  ),
  ColumBuilder(
    name: 'Department name',
  )
];
