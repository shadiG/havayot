import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'hv_theme.dart';

enum _DividerKind { horizontal, vertical }

@immutable
class HvDivider extends StatelessWidget {
  final Color color;
  final _DividerKind _kind;

  const HvDivider.horizontal({
    super.key,
    required this.color,
  }) : _kind = _DividerKind.horizontal;

  const HvDivider.vertical({
    super.key,
    required this.color,
  }) : _kind = _DividerKind.vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _kind == _DividerKind.horizontal ? 1.0 : null,
      width: _kind == _DividerKind.vertical ? 1.0 : null,
      color: color,
    );
  }
}
