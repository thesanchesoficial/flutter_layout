library flutter_layout;

import 'package:flutter/material.dart';
import 'package:flutter_layout/flutter_layout.dart';

class Layout extends StatelessWidget {
  final LayoutFormat layoutFormat;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isBlank;
  final bool isGrid;
  final bool isFlexible;
  final double width;
  final double height;
  final BoxConstraints constraints;
  final List<WidgetGrid> grids;
  final List<WidgetFlexible> flexible;
  final Widget blank;

  const Layout.blank({
    this.layoutFormat,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.constraints,
    this.blank,
  }) : 
    isBlank = true,
    isGrid = false,
    isFlexible = false,
    grids = null,
    flexible = null,
    super();

  const Layout.flexible({
    this.layoutFormat,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.constraints,
    this.flexible,
  }) : 
    isBlank = false,
    isGrid = false,
    isFlexible = true,
    grids = null,
    blank = null,
    super();

  const Layout.grid({
    this.layoutFormat,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.constraints,
    this.grids,
  }) : 
    isBlank = false,
    isGrid = true,
    isFlexible = false,
    flexible = null,
    blank = null,
    super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      constraints: constraints,
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      color: backgroundColor,
      child: isBlank
        ? Container()
        : isFlexible
          ? LayoutFlexible(
            layoutFormat: layoutFormat,
            children: flexible,
          )
          : LayoutGrid(
            layoutFormat: layoutFormat,
            children: grids,
          ),
    );
  }
}
