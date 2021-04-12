import 'package:flutter/material.dart';

class OwWrap extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final double rowHeight;
  final double spacing;
  final double runSpacing;
  final int horizontalQuantity;
  final List<double> numbersInRowAccordingToWidgth;
  final WrapAlignment alignment;
  final bool centeredChildren;
  final int maxNumberOfRows;
  final List<int> flexColumns;
  final List<double> widthColumns;
  final List<double> heightRows;
  final BoxConstraints constraints;

  const OwWrap({
    Key key,
    this.children,
    this.padding,
    this.constraints,
    this.rowHeight,
    this.spacing = 10,
    this.runSpacing = 20,
    this.horizontalQuantity = 1,
    this.numbersInRowAccordingToWidgth,
    this.centeredChildren = false,
    this.alignment = WrapAlignment.start,
    this.maxNumberOfRows,
    this.flexColumns,
    this.widthColumns, // ! Verificar o que fazer quando colocar um némero maior que o de numbersInRowAccordingToWidgth
    this.heightRows,
  }) :  assert(flexColumns == null || (widthColumns == null && flexColumns.length >= numbersInRowAccordingToWidgth.length)),
        // assert(
        //   (flexColumns == null && widthColumns == null) ||
        //   (flexColumns == null && widthColumns.length >= numbersInRowAccordingToWidgth.length) ||
        //   (widthColumns == null && flexColumns.length >= numbersInRowAccordingToWidgth.length)
        // ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: padding,
      constraints: constraints,
      child: Wrap(
        key: key,
        spacing: spacing,
        runSpacing: runSpacing,
        alignment: alignment,
        children: _children(context),
      ),
    );
  }

  List<Widget> _children(BuildContext context) {
    List<Widget> returned = [];
    double _widthScreen = MediaQuery.of(context).size.width;

    int _horizontalQuantity;
    if(numbersInRowAccordingToWidgth == null) {
      _horizontalQuantity = horizontalQuantity;
    } else {
      int i = 0;
      for(; i < numbersInRowAccordingToWidgth.length; i++) {
        if(_widthScreen <= numbersInRowAccordingToWidgth[i]) {
          break;
        }
      }
      // if(children != null && i >= children.length) {
      //   i = children.length - 1;
      // }
      _horizontalQuantity = i + 1;
    }

    double spacingWidth = spacing - (spacing / _horizontalQuantity) + 0.01; // 0.01 to avoid overflow
    double paddingWidth = 0;
    if(padding != null) {
      paddingWidth = padding.horizontal / _horizontalQuantity;
    }

    double widthExpandedContent = (_widthScreen / _horizontalQuantity) - spacingWidth;
    widthExpandedContent -= paddingWidth;

    int row = 1;
    int column = 0;
    for(Widget element in children) {
      if(column == _horizontalQuantity) {
        column = 0;
        row++;
      }
      column++;
      // print("Child: $row x $column = $element");

      bool hasFlex = false; // ! Terminar (com width = [X, null, X] e tem 3 colunas, as 2 últimas ficam com expanded ao invés de só a do meio)
      if(flexColumns != null) {
        for(int i = 0; i < flexColumns.length && i < _horizontalQuantity; i++) {
          if(flexColumns[i] != null) {
            hasFlex = true;
            break;
          }
        }
      }

      double flexWidth;
      double widthColumn;
      if(flexColumns != null) {
        int totalFlexColumns = 0;
        for(int i = 0; i < flexColumns.length && i < _horizontalQuantity; i++) { // * Ver se tem que ser i < _horizontalQuantity - 1
          totalFlexColumns += flexColumns[i];
        }
        flexWidth = _widthScreen * (flexColumns[column - 1] / totalFlexColumns) - spacingWidth - paddingWidth;
      } else if (widthColumns != null) {
        double totalWidthColumns = 0;
        int nonNullQuantity = 0;
        for(int i = 0; i < widthColumns.length && i < _horizontalQuantity - 1; i++) {
          if(widthColumns[i] != null) {
            totalWidthColumns += widthColumns[i];
            nonNullQuantity++;
          }
        }

        if(
          widthColumns.length > column - 1 && 
          column != _horizontalQuantity && 
          widthColumns[column - 1] != null
        ) {
          widthColumn = widthColumns[column - 1];
        } else {
          widthColumn = ((_widthScreen - totalWidthColumns - (nonNullQuantity * spacingWidth)) / (_horizontalQuantity - nonNullQuantity));
          widthColumn -= paddingWidth + spacingWidth;
        }
      }

      double heightRow;
      if(heightRows != null) {
        if(heightRows.length > row - 1) {
          heightRow = heightRows[row - 1];
        }
      }

      if(
        maxNumberOfRows == null ||
        (maxNumberOfRows != null && row <= maxNumberOfRows)
      ) {
        double _width = flexWidth ?? widthColumn ?? widthExpandedContent;
        if(_width < 0) {
          _width = 0;
        }

        returned.add(
          Container(
            alignment: centeredChildren
              ? Alignment.center
              : null,
            child: element,
            width: _width,
            height: heightRow ?? rowHeight,
          ),
        );
      } else {
        break;
      }
    }
    return returned;
  }
}
