import 'package:flutter/material.dart';

import 'hv_theme.dart';
import 'tappable.dart';

typedef OnChanged<T> = void Function(T value);

class HvRadio<T> extends StatefulWidget {
  final T value;
  final double size;
  final Color? unSelectedColor;
  final Color? selectedColor;
  final OnChanged onChanged;
  final T? groupValue;

  final double selectedBorderWidth;
  final double unSelectedBorderWidth;

  const HvRadio({
    Key? key,
    required this.size,
    required this.groupValue,
    this.unSelectedColor,
    this.selectedColor,
    required this.value,
    required this.onChanged,
    this.selectedBorderWidth = 4.0,
    this.unSelectedBorderWidth = 1.0,
  }) : super(key: key);

  @override
  _HvRadioState createState() => _HvRadioState();
}

class _HvRadioState extends State<HvRadio> {
  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    final selected = widget.groupValue == widget.value;
    return Tappable(
      onTap: () {
        widget.onChanged.call(widget.value);
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected
                ? (widget.selectedColor ?? theme.secondary)
                : (widget.unSelectedColor ?? theme.primary1),
            width: selected ? widget.selectedBorderWidth : widget.unSelectedBorderWidth,
          ),
          color: selected
              ? (widget.selectedColor ?? theme.primary1)
              : (widget.unSelectedColor ?? theme.secondary),
        ),
      ),
    );
  }
}
