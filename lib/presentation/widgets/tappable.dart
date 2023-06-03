
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Tappable extends StatefulWidget {
  const Tappable({
    super.key,
    required this.child,
    this.padding,
    this.pressedOpacity = 0.4,
    required this.onTap,
  }) : assert(pressedOpacity == null || (pressedOpacity >= 0.0 && pressedOpacity <= 1.0));

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double? pressedOpacity;
  bool get enabled => onTap != null;

  @override
  _TappableState createState() => _TappableState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'));
  }
}

class _TappableState extends State<Tappable> with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 10);
  static const Duration kFadeInDuration = Duration(milliseconds: 100);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  final _childTappablesCurrentlyHandlingOnTap = <_TappableState>[];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(Tappable old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    context.findAncestorStateOfType<_TappableState>()?._childTappablesCurrentlyHandlingOnTap.add(this);
    if (_childTappablesCurrentlyHandlingOnTap.isEmpty && !_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    context.findAncestorStateOfType<_TappableState>()?._childTappablesCurrentlyHandlingOnTap.remove(this);
    if (_childTappablesCurrentlyHandlingOnTap.isEmpty && _buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    context.findAncestorStateOfType<_TappableState>()?._childTappablesCurrentlyHandlingOnTap.remove(this);
    if (_childTappablesCurrentlyHandlingOnTap.isEmpty && _buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0, duration: kFadeOutDuration)
        : _animationController.animateTo(0.0, duration: kFadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: widget.onTap,
      child: Semantics(
        button: true,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
