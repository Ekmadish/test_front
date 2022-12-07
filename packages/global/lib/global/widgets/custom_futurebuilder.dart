import 'package:flutter/widgets.dart';

class CustomFutureBuilder<T> extends StatefulWidget {
  final Future<T>? future;

  final bool? rememberFutureResult;

  final Widget? whenActive;

  final Widget? whenWaiting;

  final Widget? whenNone;

  final Widget? whenNotDone;

  final Widget Function(T snapshotData)? whenDone;

  final Widget Function(Object? error)? whenError;

  final T? initialData;

  const CustomFutureBuilder(
      {Key? key,
      this.future,
      this.rememberFutureResult,
      this.whenDone,
      this.whenNotDone,
      this.whenError,
      this.whenActive,
      this.whenNone,
      this.whenWaiting,
      this.initialData})
      : assert(future != null),
        assert(rememberFutureResult != null),
        assert(whenDone != null),
        assert(whenNotDone != null),
        super(key: key);

  @override
  _EnhancedFutureBuilderState createState() {
    return _EnhancedFutureBuilderState<T>();
  }
}

class _EnhancedFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  Future<T>? _cachedFuture;

  @override
  void initState() {
    super.initState();
    _cachedFuture = widget.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      key: const Key('FutureBuilder'),
      future: widget.rememberFutureResult! ? _cachedFuture : widget.future,
      initialData: widget.initialData,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (widget.whenActive != null &&
            snapshot.connectionState == ConnectionState.active) {
          return widget.whenActive!;
        }

        if (widget.whenNone != null &&
            snapshot.connectionState == ConnectionState.none) {
          return widget.whenNone!;
        }

        if (widget.whenWaiting != null &&
            snapshot.connectionState == ConnectionState.waiting) {
          return widget.whenWaiting!;
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            if (widget.whenError != null) {
              return widget.whenError!(snapshot.error!);
            } else {
              return widget.whenNotDone!;
            }
          }
          return widget.whenDone!(snapshot.data as T);
        }

        return widget.whenNotDone!;
      },
    );
  }
}
