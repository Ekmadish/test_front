import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/model/models.dart';
import 'package:tasu/global/widgets/widgets.dart';

import 'widget/title_widget.dart';

class BasicInformationWidget extends StatelessWidget {
  final SubCompanyModelDataList? data;
  const BasicInformationWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TfTitle(
                    isRequired: true,
                    title: 'l_CompanyName',
                    hintText: data != null ? data!.name! : '',
                  ),
                  TfTitle(
                    isRequired: true,
                    hintText: data != null ? data!.nameOriginal! : '',
                    title: 'l_Directorsfullname',
                  ),
                  TfTitle(
                    isRequired: true,
                    title: 'l_Post',
                    hintText: data != null ? data!.postGuid : '',
                  ),
                  TfTitle(
                    isRequired: true,
                    title: 'l_Pricingtype',
                    hintText: data != null ? data!.pricingType! : '',
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              Column(
                children: const [
                  TfTitle(
                    isRequired: true,
                    title: 'l_Nameinoriginal',
                  ),
                  TfTitle(
                    isRequired: false,
                    title: 'l_Inthenameofwhom',
                  ),
                  TfTitle(
                    isRequired: true,
                    title: 'l_VATrate',
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: const [
                    TfTitle(
                      isRequired: true,
                      title: 'l_Companycode',
                    ),
                    TfTitle(
                      isRequired: true,
                      title: 'l_VATcode',
                    ),
                    TfTitle(
                      isRequired: true,
                      title: 'l_RRC',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: const [
                    TfTitle(
                      isRequired: false,
                      title: '',
                    ),
                    TfTitle(
                      isRequired: true,
                      title: 'l_CorrespondentAccoun',
                    ),
                    TfTitle(
                      isRequired: true,
                      title: 'l_OGRN',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title('l_Contactinformation'),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Country',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Address',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Telephone',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Email',
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              checkColor: Colors.red,
                              autofocus: false,
                              fillColor: MaterialStateProperty.all(
                                  Colors.blueGrey[200]),
                              value: false,
                              onChanged: (b) {},
                            ),
                            Text(
                              'l_MainCompany'.i18n(),
                              style: const TextStyle(
                                  color: Color(0XFFc8c3bc),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title(''),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_City',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_PostCode',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Fax',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Website',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title('l_Correspondentinformation'),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Country',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Address',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Telephone',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Email',
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title(''),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_City',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_PostCode',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Fax',
                        ),
                        const TfTitle(
                          isRequired: true,
                          title: 'l_Website',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
