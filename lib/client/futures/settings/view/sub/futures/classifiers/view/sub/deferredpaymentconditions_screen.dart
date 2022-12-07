import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasu/client/data/repository.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/classifiers/model/deferredpaymentterm_model.dart';
import 'package:tasu/client/futures/settings/widget/widgets.dart';
import 'package:tasu/client/view/widget/widgets.dart';
import 'package:tasu/global/widgets/widgets.dart';

class DeferredpaymentconditionsScreen extends StatelessWidget {
  const DeferredpaymentconditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClientRepository r = ClientRepository();
    return FutureBuilderWidget<DeferredpaymenttermModel>(
      future: r.deferredpaymenttermList(),
      whenError: (error) => Center(
        child: Text(error.toString()),
      ),
      whenDone: (snapshotData) {
        return BodyWidget(
          columnName: _item,
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
    );
  }
}

const List<ColumBuilder> _item = [
  ColumBuilder(name: 'Deferred payment conditions'),
  ColumBuilder(name: 'Full text')
];
