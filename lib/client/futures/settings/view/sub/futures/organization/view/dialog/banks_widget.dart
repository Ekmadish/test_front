import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/model/models.dart';
import 'package:tasu/global/widgets/widgets.dart';

import 'widget/title_widget.dart';

TextStyle _style = const TextStyle(
    color: Color(0XFFc8c3bc), fontSize: 12, fontWeight: FontWeight.w400);

class BankWidget extends StatelessWidget {
  const BankWidget({Key? key}) : super(key: key);

  static final List<String> _top = [
    'l_OperatingAccount',
    'l_BankCode',
    'l_Bank',
    'Swift'
  ];
  @override
  Widget build(BuildContext context) {
    final ClientRepository r = ClientRepository();
    return FutureBuilderWidget<CurrencyModel>(
      future: r.currencyList(),
      whenError: (error) => const Center(
        child: Text('Error'),
      ),
      whenDone: (snapshotData) => ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(
            height: 97,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _top
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: TfRich(
                            maxLines: 10,
                            isMulti: true,
                            title: e,
                            isRequired: false),
                      ))
                  .toList(),
            ),
          ),
          title('l_Dinvoicesfordcurrencies'),
          Row(
            children: [
              Expanded(
                child: FutureBuilderWidget<BankModel>(
                    future: r.bankList(),
                    whenError: (error) => const Center(
                          child: Text('Error'),
                        ),
                    whenDone: (snapshot) => Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'l_Currency'.i18n(),
                                  style: _style,
                                ),
                                const Spacer(flex: 2),
                                Text(
                                  'l_OperatingAccount'.i18n(),
                                  style: _style,
                                ),
                                const Spacer(
                                  flex: 5,
                                ),
                                Text(
                                  'l_CorrespondentBank'.i18n(),
                                  style: _style,
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                            ...snapshotData.dataList!.map(
                              (e) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.name!, style: _style),
                                    const SizedBox(width: 20),
                                    const TfStandart(isRequired: true),
                                    TfDropdown(
                                        items: snapshot.dataList!
                                            .map((e) => e.name!)
                                            .toList(),
                                        isRequired: true),
                                  ],
                                );
                              },
                            ).toList()
                          ],
                        )),
              ),
              Expanded(
                  child: Container(
                color: Colors.teal,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
