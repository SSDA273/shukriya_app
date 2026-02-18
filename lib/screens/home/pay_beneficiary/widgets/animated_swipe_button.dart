import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/asset_manager.dart';

class AnimatedSwipeToConfirm extends StatefulWidget {
  const AnimatedSwipeToConfirm({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);
  final VoidCallback onConfirm;

  @override
  State<AnimatedSwipeToConfirm> createState() => _AnimatedSwipeToConfirmState();
}

class _AnimatedSwipeToConfirmState extends State<AnimatedSwipeToConfirm> {
  late double _maxWidth;
  double _handleSize = 0;
  double _dragValue = 0;
  double _dragWidth = 0;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      _maxWidth = constraint.maxWidth;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 46.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF7B3884),
              Color(0xffC34BD4),
            ],
          ),
          borderRadius: BorderRadius.circular(80),
        ),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Text(
                  _dragWidth > 150 ? " " : "Swipe to send money",
                  // _confirmed ? " " : "Swipe to send money",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: _dragWidth < 41.w ? 41.w : _dragWidth,
                child: Row(
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    GestureDetector(
                        onHorizontalDragUpdate: _onDragUpdate,
                        onHorizontalDragEnd: _onDragEnd,
                        child: Container(
                            height: 44.h,
                            width: 41.w,
                            margin: EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(255, 255, 255, 0.5),
                                    Color.fromRGBO(255, 255, 255, 0),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: SvgPicture.asset(ImageAssets.swipeArrow))),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragWidth += details.delta.dx;
      if (_dragWidth < 41.w) _dragWidth = 41.w;
      if (_dragWidth > _maxWidth) _dragWidth = _maxWidth;
      _dragValue = _dragWidth / _maxWidth;
    });
    print("Drag Width: $_dragWidth, Drag Value: $_dragValue");
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragValue > .9) {
      _dragValue = 1;
    } else {
      _dragValue = 0;
    }

    setState(() {
      _dragWidth = _maxWidth * _dragValue;
      _confirmed = _dragValue == 1;
    });

    if (_dragValue == 1) {
      widget.onConfirm();
      setState(() {
        _dragWidth = 0;
      });
    }
  }
}
