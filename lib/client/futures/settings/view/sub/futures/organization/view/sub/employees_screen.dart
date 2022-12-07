import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/model/models.dart';
import 'package:tasu/client/futures/settings/widget/body_widget.dart';
import 'package:tasu/client/model/dialog_edit_model.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/widgets.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientRepository r = ClientRepository();
    return FutureBuilderWidget<EmployeeModel>(
      future: r.employeeList(),
      whenDone: (snapshotData) => BodyWidget(
        columnName: _item,
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
                rowItemWidget(
                  data.name ?? 'null',
                ),
                rowItemWidget(
                  data.name ?? 'null',
                ),
                rowItemWidget(
                  data.name ?? 'null',
                ),
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
        itemCount: snapshotData.total!,
      ),
      whenError: (error) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}

List<ColumBuilder> _item = const [
  ColumBuilder(
    name: 'Login',
  ),
  ColumBuilder(
    name: 'Email',
  ),
  ColumBuilder(
    name: 'Groups',
  ),
  ColumBuilder(
    name: 'Name,Surname',
  ),
  ColumBuilder(
    name: 'Telephone',
  ),
  ColumBuilder(name: 'Date of last visit')
];
