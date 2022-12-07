import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/classifiers/model/models.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/global/widgets/futurebuilder_widget.dart';

class ActivityareaScreen extends StatelessWidget {
  const ActivityareaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientRepository r = ClientRepository();
    return FutureBuilderWidget<ActivityAreaModel>(
      future: r.activityAreaList(),
      whenDone: (snapshotData) {
        return BodyWidget(
          columnName: [],
          itemBuilder: (context, index) => Container(
            color: Colors.red,
            child: const Text(
              'TODO',
              style: TextStyle(fontSize: 24),
            ),
          ),
          itemCount: snapshotData.total!,
          key: key,
        );
      },
      whenError: (error) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
