library flutter_layout;

import 'package:flutter/material.dart';

class Grid2x1 extends StatefulWidget {
  final Widget primary;
  final Widget secondary;
  final double min;
  Grid2x1(this.primary, this.secondary, this.min);

  @override
  _Grid2x1State createState() => _Grid2x1State();
}

class _Grid2x1State extends State<Grid2x1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: MediaQuery.of(context).size.width > widget.min  
        ? Row(
          children: [
            Expanded(
              child: widget.primary,
            ),
            Expanded(
              child: widget.secondary,
            )
          ],
        )
        : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.primary,
            widget.secondary,
          ],
        ),
    );
  }
}