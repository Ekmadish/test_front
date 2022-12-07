
import 'package:admin/admin/futures/company/cubit/company_cubit.dart';
import 'package:admin/admin/futures/company/model/compony_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global/global/widgets/loading_widget.dart';
import 'package:global/global/widgets/textfild_widget.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transcompanyCubit = context.read<CompanyCubit>();
    transcompanyCubit.getTranscompanyList();

    return BlocBuilder<CompanyCubit, CompanyState>(
      // buildWhen: (previous, current) => false,
      builder: (context, state) {
        if (state.loading) {
          return const LoadingWidget();
        } else if (state.error) {
          return const Center(child: Text('errror'));
        } else {
          final DataTableSource data =
              MyData(companyListModel: state.companyListModel);

          return Scaffold(
            body: SingleChildScrollView(
              child: PaginatedDataTable(
                source: data,
                showFirstLastButtons: true,
                rowsPerPage: PaginatedDataTable.defaultRowsPerPage,
                header: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 3, child: TextFialdWidget(hintText: 'Search')),
                    Expanded(
                      child: ButtonBar(
                        children: [
                          TextButton(onPressed: () {}, child: const Icon(Icons.sort)),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.sort_by_alpha)),
                          TextButton(
                              onPressed: () {}, child: const Icon(Icons.short_text)),
                        ],
                      ),
                    )
                  ],
                ),
                onSelectAll: (b) {},
                sortAscending: true,
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('GUID')),
                  DataColumn(label: Text('CompanyName')),
                  DataColumn(label: Text('Bin')),
                  DataColumn(label: Text('Role')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('IsVerify')),
                  DataColumn(label: Text('AddTime')),
                  DataColumn(label: Text('UpdateTime')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('LogoUrl')),
                  DataColumn(label: Text('Tin')),
                  DataColumn(label: Text('Ogrn')),
                  DataColumn(label: Text('Okpo')),
                  DataColumn(label: Text('Trn')),
                  DataColumn(label: Text('Rrc')),
                  DataColumn(label: Text('Info')),
                  DataColumn(label: Text('BusinessLicenseUrl')),
                  DataColumn(label: Text('LegalRepresentativeName')),
                  DataColumn(label: Text('LegalRepresentativeId')),
                ],
                horizontalMargin: 10,
                showCheckboxColumn: true,
              ),
            ),
          );
        }
      },
    );
  }
}

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true, create: (context) => CompanyCubit(), child: const Root());
  }
}

class MyData extends DataTableSource {
  final CompanyListModel? companyListModel;
  // Generate some made-up data

  MyData({required this.companyListModel});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => companyListModel!.dataList!.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    // log('th len  is===>${companyListModel!.dataList!.length.toString()}');
    return DataRow(cells: [
      DataCell(Text(companyListModel!.dataList![index].id.toString())),
      DataCell(Text(companyListModel!.dataList![index].guid.toString())),
      DataCell(Text(companyListModel!.dataList![index].companyName.toString())),
      DataCell(Text(companyListModel!.dataList![index].bin.toString())),
      DataCell(Text(companyListModel!.dataList![index].role.toString())),
      DataCell(Text(companyListModel!.dataList![index].status.toString())),
      DataCell(Text(companyListModel!.dataList![index].isVerify.toString())),
      DataCell(Text(companyListModel!.dataList![index].addTime.toString())),
      DataCell(Text(companyListModel!.dataList![index].updateTime.toString())),
      DataCell(Text(companyListModel!.dataList![index].qStatus.toString())),
      DataCell(Text(companyListModel!.dataList![index].logoUrl.toString())),
      DataCell(Text(companyListModel!.dataList![index].tin.toString())),
      DataCell(Text(companyListModel!.dataList![index].ogrn.toString())),
      DataCell(Text(companyListModel!.dataList![index].okpo.toString())),
      DataCell(Text(companyListModel!.dataList![index].trn.toString())),
      DataCell(Text(companyListModel!.dataList![index].rrc.toString())),
      DataCell(Text(companyListModel!.dataList![index].info.toString())),
      DataCell(Text(
          companyListModel!.dataList![index].businessLicenseUrl.toString())),
      DataCell(Text(companyListModel!.dataList![index].legalRepresentativeName
          .toString())),
      DataCell(Text(
          companyListModel!.dataList![index].legalRepresentativeId.toString())),
    ]);
  }
}
