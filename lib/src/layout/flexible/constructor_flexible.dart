library flutter_layout;

import 'package:flutter/material.dart';
import 'package:flutter_layout/flutter_layout.dart';

class LayoutFlexible extends StatelessWidget {
  final LayoutFormat layoutFormat;
  final List<WidgetFlexible> children;

  const LayoutFlexible({
    this.layoutFormat,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    switch (layoutFormat) {
      case LayoutFormat.layout2x1:
        return Container(
          child: Row(
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout3x1:
        return Container(
          child: Row(
            children: children,
          ),
        );
        break;
      case LayoutFormat.layout4x1:
        return Container(
          child: Row(
            children: children,
          ),
        );
        break;
      default:
        return Container(
          child: Text("Passe o Layoutformat correspondente."),
        );
    }
    
  }
}