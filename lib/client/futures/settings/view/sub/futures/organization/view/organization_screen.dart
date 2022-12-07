import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tasu/client/constant/client_constant.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/data/organization_provider.dart';
import 'package:tasu/client/view/widget/addupdate_dialog_widget.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/utils/utils.dart';

import 'dialog/dialogwidgets.dart';
import 'sub/sub.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: true,
      create: (context) => Organization(),
      child: Builder(builder: (context) {
        var provider = context.read<Organization>();
        return Padding(
          padding: const EdgeInsets.all(13.0),
          child: Consumer<Organization>(
            builder: (context, value, child) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LeftCardWidget(
                  items: provider.organizationitems,
                  title: 'l_OrgSection',
                  onTap: (i) => provider.onSectionChange(i),
                  selectedIndex: provider.selectedIndex,
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                RightCardWidget(
                  body: _body(provider.selectedIndex),
                  title: provider.organizationitems[provider.selectedIndex],
                  filterwidget: AddWidget(
                    onPresse: () {
                      Utils.showPopWiddow(context,
                          title: 'l_NewCompany',
                          body: AddUpdateDialogWidget(
                            body: const [
                              BasicInformationWidget(),
                              BankWidget(),
                              SignatureWidget(),
                            ],
                            tabs: const [
                              'l_BasicInformation',
                              'l_Banks',
                              'l_Signature'
                            ],
                            key: key,
                            color: ClientConstant.tabDestination[9].color,
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget _body(int i) {
  switch (i) {
    case 0:
      return const CompaniesScreen();
      break;
    case 1:
      return const DepartmentsScreen();
      break;
    case 2:
      return const EmployeesScreen();
      break;
    default:
      return const EmployeesGroupScreen();
  }
}
