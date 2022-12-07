import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/client/view/widget/table_column_widget.dart';
import 'package:tasu/global/widgets/futurebuilder_widget.dart';

class BreakingruleScreen extends StatelessWidget {
  const BreakingruleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientRepository r = ClientRepository();
    return FutureBuilderWidget(
      future: r.bankList(),
      whenDone: (snapshotData) => BodyWidget(
        columnName: const [
          ColumBuilder(
            name: 'Name',
          ),
          ColumBuilder(
            name: 'Devider',
          ),
          ColumBuilder(name: 'Element rule list')
        ],
        itemBuilder: (context, index) {
          var m = snapshotData.dataList![index];

          return Container(
              height: 39,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff363a3d))),
              child: Row(
                children: const [
                  Text(
                    'TODO',
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ));
        },
        itemCount: snapshotData.total!,
      ),
    );
  }
}
