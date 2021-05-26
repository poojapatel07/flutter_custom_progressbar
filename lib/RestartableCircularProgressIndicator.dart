
import 'package:flutter/material.dart';
import 'package:flutter_custom_progressbar/ProgressController.dart';

class RestartableCircularProgressIndicator extends StatefulWidget {
  final ProgressController controller;
  final VoidCallback onTimeout;

  RestartableCircularProgressIndicator({
    Key key,
    @required this.controller,
    this.onTimeout,
  })  : assert(controller != null),
        super(key: key);

  @override
  _RestartableCircularProgressIndicatorState createState() =>
      _RestartableCircularProgressIndicatorState();
}

class _RestartableCircularProgressIndicatorState
    extends State<RestartableCircularProgressIndicator> {
  ProgressController get controller => widget.controller;

  VoidCallback get onTimeout => widget.onTimeout;

  @override
  void initState() {
    super.initState();
    controller.progressStream.listen((_) => updateState());
    controller.timeoutStream.listen((_) => onTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.progress,
    );
  }

  void updateState() => setState(() {});
}