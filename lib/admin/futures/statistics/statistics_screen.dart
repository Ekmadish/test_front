import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasu/admin/futures/statistics/cubit/statistics_cubit.dart';
import 'package:tasu/global/widgets/widgets.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statisticsCubit = context.read<StatisticsCubit>();
    statisticsCubit.staticsBaseInfo();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('StatisticsScreen'),
            BlocBuilder<StatisticsCubit, StatisticsState>(
              builder: (context, state) {
                if (state.baseAdminModel != null) {
                  if (state.loading) {
                    return const LoadingWidget();
                  } else {
                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      // direction: Axis.horizontal,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _item(
                          'totalCompanyCount',
                          state.baseAdminModel!.totalCompanyCount.toString(),
                        ),
                        _item(
                          'totalUserCount',
                          state.baseAdminModel!.totalUserCount.toString(),
                        ),
                        _item(
                          'totalPersonCount',
                          state.baseAdminModel!.totalPersonCount.toString(),
                        ),
                        _item(
                          'dayCompanyCount',
                          state.baseAdminModel!.dayCompanyCount.toString(),
                        ),
                        _item(
                          'dayUserCount',
                          state.baseAdminModel!.dayUserCount.toString(),
                        ),
                        _item(
                          'dayPersonCount',
                          state.baseAdminModel!.dayPersonCount.toString(),
                        ),
                      ],
                    );
                  }
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.cyan,
      ),
      padding: const EdgeInsets.all(10),
      width: 150,
      // height: 99,
      alignment: Alignment.center,
      child: Column(
        children: [
          SelectableText(
            title,
            strutStyle: const StrutStyle(height: 3, leading: 5),
            textAlign: TextAlign.center,
            // style: TextStyle(fontSize: 16),
          ),
          SelectableText(
            name,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
