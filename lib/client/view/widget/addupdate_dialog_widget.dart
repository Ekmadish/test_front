import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class AddUpdateDialogWidget extends StatefulWidget {
  final List<Widget> body;
  final List<String> tabs;
  final Color color;
  const AddUpdateDialogWidget(
      {Key? key, required this.body, required this.tabs, required this.color})
      : super(key: key);

  @override
  State<AddUpdateDialogWidget> createState() => _AddUpdataWidgetState();
}

class _AddUpdataWidgetState extends State<AddUpdateDialogWidget> {
  final ValueNotifier<int> _tabIndex = ValueNotifier(0);

  @override
  void dispose() {
    _tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.body.isEmpty || widget.tabs.isEmpty
        ? const SizedBox()
        : ValueListenableBuilder<int>(
            valueListenable: _tabIndex,
            key: const ValueKey('ValueListenableBuilder'),
            builder: (context, index, child) => Column(
              children: [
                Container(
                  height: 38,
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Row(
                        children: widget.tabs
                            .map((e) => InkWell(
                                  onTap: () {
                                    _tabIndex.value = widget.tabs.indexOf(e);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: index == widget.tabs.indexOf(e)
                                            ? widget.color
                                            : Colors.transparent,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                        )),
                                    child: Tab(
                                      child: Text(
                                        e.i18n(),
                                        style: TextStyle(
                                          color: index != widget.tabs.indexOf(e)
                                              ? widget.color
                                              : Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
                Container(color: widget.color, height: 4),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.zero,
                    child: widget.body[index],
                  ),
                )
              ],
            ),
          );
  }
}
