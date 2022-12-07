import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';

class CarrierstypesScreen extends StatelessWidget {
  const CarrierstypesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientRepository r = ClientRepository();
    return const SizedBox();

    // FutureBuilderWidget<CargoStatusModel>(
    //   future: r.cargoStatusList(),
    //   whenDone: (snapshotData) => BodyWidget(
    //     columnName: const [
    //       ColumBuilder(
    //         name: 'Name',
    //         flex: 4,
    //       ),
    //       ColumBuilder(name: 'Initial'),
    //       ColumBuilder(name: 'Final'),
    //       ColumBuilder(name: 'Tag')
    //     ],
    //     itemBuilder: (context, index) {
    //       CargoStatusDataList m = snapshotData.dataList![index];
    //       return Container(
    //           height: 39,
    //           padding: const EdgeInsets.symmetric(horizontal: 4),
    //           decoration: BoxDecoration(
    //               border: Border.all(color: const Color(0xff363a3d))),
    //           child: Row(
    //             children: [
    //               rowItemWidget(
    //                 flex: 4,
    //                 m.name!.trim(),
    //               ),
    //               rowItemWidget(
    //                 m.isInitial == 1 ? "Yes" : "No",
    //               ),
    //               rowItemWidget(
    //                 m.isFinal == 1 ? "Yes" : "No",
    //               ),
    //               rowItemWidget(
    //                 m.qStatus.toString(),
    //               ),
    //               RowEditButtonWidget(
    //                 editbody: const DialogEditModel(
    //                   body: [
    //                     BankWidget(),
    //                     SignatureWidget(),
    //                   ],
    //                   title: ['l_Banks', 'l_Signature'],
    //                 ),
    //                 pressOkCallback: () {},
    //               ),
    //             ],
    //           ));
    //     },
    //     itemCount: snapshotData.total!,
    //   ),
    // );
  
  
  
  }
}
