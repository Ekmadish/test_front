import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/classifiers/model/models.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/view/dialog/banks_widget.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/view/dialog/dialogwidgets.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/client/model/models.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/futurebuilder_widget.dart';

class CargostatusesScreen extends StatelessWidget {
  const CargostatusesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientRepository r = ClientRepository();
    return FutureBuilderWidget<CargoStatusModel>(
      future: r.cargoStatusList(),
      whenDone: (snapshotData) => BodyWidget(
        columnName: const [
          ColumBuilder(
            name: 'Name',
            flex: 4,
          ),
          ColumBuilder(name: 'Initial'),
          ColumBuilder(name: 'Final'),
          ColumBuilder(name: 'Tag')
        ],
        itemBuilder: (context, index) {
          CargoStatusDataList m = snapshotData.dataList![index];
          return Container(
              height: 39,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff363a3d))),
              child: Row(
                children: [
                  rowItemWidget(
                    flex: 4,
                    m.name!.trim(),
                  ),
                  rowItemWidget(
                    m.isInitial == 1 ? "Yes" : "No",
                  ),
                  rowItemWidget(
                    m.isFinal == 1 ? "Yes" : "No",
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
              ));
        },
        itemCount: snapshotData.total!,
      ),
    );
 
 
 
 
  }
}
