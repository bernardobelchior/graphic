import 'dart:async';
import 'dart:ui';

import 'package:graphic/src/aes/color.dart';
import 'package:graphic/src/aes/elevation.dart';
import 'package:graphic/src/aes/gradient.dart';
import 'package:graphic/src/aes/label.dart';
import 'package:graphic/src/algebra/varset.dart';
import 'package:graphic/src/aes/shape.dart';
import 'package:graphic/src/aes/size.dart';
import 'package:graphic/src/interaction/selection/selection.dart';
import 'package:graphic/src/shape/area.dart';

import 'function.dart';
import 'modifier/modifier.dart';

/// The specification of an area element.
///
/// An area graphing produces a graph containing all points within the region between
/// two lines.
///
/// It will check and complete position points by the rule of:
///
/// ```
/// [start, end] | [end] => [start, end]
/// ```
class AreaElement extends FunctionElement<AreaShape> {
  /// Creates an area element.
  AreaElement({
    ColorAttr? color,
    ElevationAttr? elevation,
    GradientAttr? gradient,
    LabelAttr? label,
    Varset? position,
    ShapeAttr<AreaShape>? shape,
    SizeAttr? size,
    List<Modifier>? modifiers,
    int? layer,
    Selected? selected,
    StreamController<Selected?>? selectionChannel,
  }) : super(
          color: color,
          elevation: elevation,
          gradient: gradient,
          label: label,
          position: position,
          shape: shape,
          size: size,
          modifiers: modifiers,
          layer: layer,
          selected: selected,
          selectionChannel: selectionChannel,
        );
}

/// The position completer of the area element.
///
/// It will check and complete position points by the rule of:
///
/// ```
/// [start, end] | [end] => [start, end]
/// ```
List<Offset> areaCompleter(List<Offset> position, Offset origin) {
  assert(position.length == 1 || position.length == 2);
  if (position.length == 1) {
    final normalZero = origin.dy;
    final end = position.first;
    return [
      Offset(end.dx, normalZero),
      end,
    ];
  }
  return position;
}
