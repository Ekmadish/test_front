import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/view/dialog/dialogwidgets.dart';
import 'package:tasu/client/futures/settings/widget/body_widget.dart';
import 'package:tasu/client/model/models.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/futurebuilder_widget.dart';

class BanksScreen extends StatelessWidget {
  const BanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientRepository r = ClientRepository();
    return FutureBuilderWidget<BankModel>(
      future: r.bankList(),
      whenDone: (snapshotData) => BodyWidget(
        columnName: _item,
        itemBuilder: (context, index) {
          var m = snapshotData.dataList![index];
          return Container(
            height: 39,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff363a3d))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                rowItemWidget(
                  m.name!,
                ),
                rowItemWidget(
                  m.name!,
                ),
                rowItemWidget(
                  m.name!,
                ),
                rowItemWidget(
                  m.qStatus!.toString(),
                ),
                rowItemWidget(
                  m.name!,
                ),
                rowItemWidget(
                  m.qStatus.toString(),
                ),
                rowItemWidget(
                  m.qStatus.toString(),
                ),
                RowEditButtonWidget(
                  editbody: const DialogEditModel(
                    body: [
                      BankWidget(),
                      SignatureWidget(),
                    ],
                    title: ['l_Banks', 'l_Signature'],
                  ),
                  pressOkCallback: () {},
                ),
              ],
            ),
          );
        },
        itemCount: snapshotData.total!,
        key: key,
      ),
    );
  }
}

const List<ColumBuilder> _item = [
  ColumBuilder(
    name: 'Name',
  ),
  ColumBuilder(
    name: 'Unofficial name',
  ),
  ColumBuilder(
    name: 'Branch',
  ),
  ColumBuilder(
    name: 'Code',
  ),
  ColumBuilder(
    name: 'SWIFT',
  ),
  ColumBuilder(name: 'Address'),
  ColumBuilder(name: 'Post code')
];
