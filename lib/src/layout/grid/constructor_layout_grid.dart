library flutter_layout;

import 'package:flutter/material.dart';
import 'package:flutter_layout/flutter_layout.dart';

class LayoutGrid extends StatelessWidget {
  final LayoutFormat layoutFormat;
  final List<WidgetGrid> children;

  const LayoutGrid({
    this.layoutFormat,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    switch (layoutFormat) {
      case LayoutFormat.layout1x2:
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout1x3:
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout1x4:
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout2x1:
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout2x2:
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout3x1:
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout3x3:
        return Container();
        break;
      case LayoutFormat.layout4x1:
        return Container();
        break;
      default:
        return Container();
    }
    
  }
}