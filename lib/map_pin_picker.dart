library map_pin_picker;

import 'package:flutter/material.dart';

class MapPickerController {
  Function()? mapMoving;
  Function()? mapFinishedMoving;
}

class MapPicker extends StatefulWidget {
  final Widget child;
  final Widget iconWidget;
  final bool? showDot;
  final double? padding;
  final MapPickerController mapPickerController;

  MapPicker(
      {required this.mapPickerController,
      required this.iconWidget,
      this.showDot = true,
      this.padding,
      required this.child});

  @override
  _MapPickerState createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widget.mapPickerController.mapMoving = mapMoving;
    widget.mapPickerController.mapFinishedMoving = mapFinishedMoving;
  }

  void mapMoving() {
    if (!animationController.isCompleted || !animationController.isAnimating) {
      animationController.forward();
    }
  }

  void mapFinishedMoving() {
    animationController.reverse();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedBuilder(
            animation: animationController,
            builder: (context, snapshot) {
              return Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: widget.padding??0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -10 * animationController.value),
                        child: widget.iconWidget,
                      ),
                      if (widget.showDot ?? false)
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
