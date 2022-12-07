import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/model/subcompany_model.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/view/dialog/dialogwidgets.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/client/model/dialog_edit_model.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/widgets.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientRepository r = ClientRepository();
    return FutureBuilderWidget<SubCompanyModel>(
      future: r.subCompanyList(),
      initialData: null,
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
                  m.nameOriginal!,
                ),
                rowItemWidget(
                  m.code!,
                ),
                rowItemWidget(
                  m.vatRateGuid!,
                ),
                rowItemWidget(
                  m.info!,
                ),
                rowItemWidget(
                  m.correspondentAccount!,
                ),
                RowEditButtonWidget(
                  editbody: DialogEditModel(
                    body: [
                      BasicInformationWidget(
                        data: m,
                      ),
                      const BankWidget(),
                      const SignatureWidget(),
                    ],
                    title: const [
                      'l_BasicInformation',
                      'l_Banks',
                      'l_Signature'
                    ],
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

      whenError: (error) => const SizedBox(
        height: 100,
        child: Center(
          child: Text('Error'),
        ),
      ),
      // whenWaiting:
    );
  }
}

List<ColumBuilder> _item = const [
  ColumBuilder(
    name: 'Company name',
  ),
  ColumBuilder(
    name: 'Name in original',
  ),
  ColumBuilder(
    name: 'Company code',
  ),
  ColumBuilder(
    name: 'VAT code',
  ),
  ColumBuilder(
    name: 'Address',
  ),
  ColumBuilder(name: 'Address for correspondence'),
];
