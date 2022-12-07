import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasu/client/constant/client_constant.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/classifiers/data/classifiers_provider.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/classifiers/view/sub/carrierstypes_screen.dart';
import 'package:tasu/client/view/widget/addupdate_dialog_widget.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/utils/utils.dart';

import 'sub/sub.dart';

class ClassifiersScreen extends StatelessWidget {
  const ClassifiersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClassifiersProvider>(
        lazy: true,
        key: const ValueKey('classifiers'),
        create: (context) => ClassifiersProvider(),
        child: Builder(
          builder: (context) {
            var provider = context.read<ClassifiersProvider>();
            return Padding(
              padding: const EdgeInsets.all(13.0),
              child: Consumer<ClassifiersProvider>(
                builder: (context, value, child) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeftCardWidget(
                        onTap: (index) {
                          provider.onSectionChange(index);
                        },
                        selectedIndex: provider.selectedIndex,
                        items: provider.classifiersItems,
                        title: 'l_ClassifiersSection'),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    RightCardWidget(
                      body: _body(provider.selectedIndex),
                      title: provider.classifiersItems[provider.selectedIndex],
                      filterwidget: AddWidget(
                        onPresse: () {
                          Utils.showPopWiddow(context,
                              title: 'l_NewCompany',
                              body: AddUpdateDialogWidget(
                                body: [
                                  Container(
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    color: Colors.green,
                                  ),
                                ],
                                tabs: const [
                                  'l_BasicInformation',
                                  'l_Banks',
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
          },
        ));
  }
}

Widget _body(int i) {
  switch (i) {
    case 0:
      return const DeferredpaymentconditionsScreen();
      break;
    case 1:
      return const ActivityareaScreen();
      break;
    case 2:
      return const BanksScreen();
      break;
    case 3:
      return const BreakingruleScreen();
      break;
    case 4:
      return const CargostatusesScreen();
      break;
    case 5:
      return const CarrierstypesScreen();
      break;
    case 6:
      return const CategoriesofotherexpensesScreen();
      break;
    case 7:
      return const ClienttypesScreen();
      break;

    case 8:
      return const ContactpersonspostsScreen();
      break;

    case 9:
      return const ContacttypesScreen();
      break;
    case 10:
      return const ContriesScreen();
      break;
    case 11:
      return const DeferredpaymentconditionsScreen();
      break;
    case 12:
      return const DocumentstatusesScreen();
      break;
    case 13:
      return const DrivinglicencecategoriesScreen();
      break;
    case 14:
      return const ExchangerateScreen();
      break;
    case 15:
      return const FederaldistrictScreen();
      break;

    case 16:
      return const FlexformpresetsScreen();
      break;

    case 17:
      return const GroupScreen();
      break;
    case 18:
      return const LoadingmethodScreen();
      break;
    case 19:
      return const MeasurementnameScreen();
      break;
    case 20:
      return const OrderstatusesScreen();
      break;
    case 21:
      return const PackagingsScreen();
      break;
    case 22:
      return const PaymenttypesScreen();
      break;

    case 23:
      return const PermissionsScreen();
      break;

    case 24:
      return const RailwaystationsScreen();
      break;
    case 25:
      return const RegionsScreen();
      break;
    case 26:
      return const RequestpurposesScreen();
      break;
    case 27:
      return const RequestsourceScreen();
      break;
    case 28:
      return const RequeststatusesScreen();
      break;
    case 29:
      return const SalesfunnelresultScreen();
      break;

    case 30:
      return const SalesfunnelstatusScreen();
      break;

    case 31:
      return const SubcategoriesofotherexpensesScreen();
      break;
    case 32:
      return const TagsScreen();
      break;
    case 33:
      return const TaskstatusesScreen();
      break;
    case 34:
      return const TransporttypesScreen();
      break;
    case 35:
      return const TripstatusesScreen();
      break;
    case 36:
      return const TruckbodytypesScreen();
      break;

    case 37:
      return const VatratesScreen();
      break;

    case 38:
      return const WorkerspostsScreen();
      break;

    default:
      return const SizedBox();
  }
}
