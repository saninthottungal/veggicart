import 'package:flutter/material.dart';
import 'package:veggicart/app/common/extensions/color_ext.dart';
import 'package:veggicart/app/common/extensions/context_ext.dart';

class ModalBarrierWrapper extends StatefulWidget {
  const ModalBarrierWrapper({
    super.key,
    required this.show,
    required this.child,
  });

  final bool show;
  final Widget? child;

  @override
  State<ModalBarrierWrapper> createState() => _ModalBarrierWrapperState();
}

class _ModalBarrierWrapperState extends State<ModalBarrierWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      value: widget.show ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(covariant ModalBarrierWrapper oldWidget) {
    if (oldWidget.show == widget.show) return;
    if (widget.show) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        //* child, mostly a scaffold
        ?widget.child,

        //* modaleBarrier
        Positioned.fill(
          child: IgnorePointer(
            ignoring: !widget.show,
            child: AnimatedModalBarrier(
              dismissible: false,
              color: ColorTween(
                begin: Colors.transparent,
                end: Colors.black38,
              ).animate(_controller),
            ),
          ),
        ),

        Positioned.fill(
          child: FadeTransition(
            opacity: _controller,
            child: Align(
              child: CircleAvatar(
                radius: 22,
                backgroundColor: context.colorScheme.primaryContainer.o7,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  padding: .all(6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
