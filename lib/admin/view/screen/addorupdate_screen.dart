import 'package:flutter/material.dart';
import 'package:tasu/admin/constant/admin_constant.dart';
import 'package:tasu/global/widgets/tr_widget.dart';
import 'package:tasu/global/widgets/widgets.dart';

class AddOrUpdateScreen extends StatelessWidget {
  final Widget centerChild;
  final bool isAdd;
  final VoidCallback btnPress;
  final ValueNotifier<AddOrUpdateSate> addupdatenotifier;

  // final ValueChanged<int>? onDestinationSelected;
  // final List<AdaptiveScaffoldDestination> destinations;
  // final int selectedIndex;
  // final Widget? drawerHeader;

  const AddOrUpdateScreen({
    Key? key,
    // this.drawerHeader,
    // this.onDestinationSelected,
    // required this.destinations,
    // required this.selectedIndex,
    required this.centerChild,
    required this.btnPress,
    required this.isAdd,
    required this.addupdatenotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<AddcompanyCubit>();
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 0)
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        icon: const Icon(Icons.home),
                        label: TrWidget(
                            trkey: 'l_Home', alignment: Alignment.centerLeft)),
                    const Text("/"),
                    TrWidget(
                      trkey: isAdd ? 'l_Add' : 'l_Update',
                      alignment: Alignment.centerLeft,
                    )
                  ],
                ),
                Container(
                    constraints:
                        const BoxConstraints(maxHeight: 40, minHeight: 40),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8),
                    child: ValueListenableBuilder<AddOrUpdateSate>(
                      valueListenable: addupdatenotifier,
                      key: const ValueKey('addUpdate'),
                      builder: (context, value, child) {
                        if (value == AddOrUpdateSate.Success) {
                          Future.delayed(const Duration(milliseconds: 100), () {
                            Navigator.pop(context);
                          });
                        }
                        if (value == AddOrUpdateSate.Loading) {
                          return const LoadingWidget();
                        } else {
                          return TextButton.icon(
                              onPressed: btnPress,
                              icon: const Icon(Icons.save),
                              label: TrWidget(
                                trkey: 'l_Save',
                                alignment: Alignment.centerLeft,
                              ));
                        }
                      },
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child:

                  // Form(
                  //   key: cubit.formKey,
                  //   child:

                  centerChild,
              // ),
            ),
          )
        ],
      ),
    );
  }

  // void _destinationTapped(AdaptiveScaffoldDestination destination) {
  //   final index = destinations.indexOf(destination);
  //   if (index != selectedIndex) {
  //     onDestinationSelected?.call(index);
  //   }
  // }
}
