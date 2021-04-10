library flutter_layout;

import 'package:flutter/material.dart';

class WidgetGrid extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;
  final double width;
  final double height;
  final BoxConstraints constraints;
  final Color backgroundColor;

  const WidgetGrid({
    this.padding,
    this.margin,
    this.child,
    this.width,
    this.height,
    this.constraints,
    this.backgroundColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    if(width == null && height == null && constraints == null) {
      return Expanded(
        child: returnWidget(context),
      );
    } else {
      return returnWidget(context);
    }
  }

  Widget returnWidget(context) {
    return SingleChildScrollView(
      child: Container(
        padding: padding,
        margin: margin,
        color: backgroundColor,
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        constraints: constraints,
        child: child,
      ),
    );
  }
}
