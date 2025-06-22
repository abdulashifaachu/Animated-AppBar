# animated_app_bar


A customizable AppBar for Flutter that auto-switches titles with slide animation.
created by Abdul Ashif
any quiries try to reach out ....

## Features

- Slide down old title
- Slide in new title from top
- Switch every 3 seconds
- Simple and stateless usage

## Usage

```dart
AppBar(
  title: AnimatedTitleAppBar(
    titles: ['Welcome', 'Dashboard', 'User Profile'],
  ),
)


Code for the AnimatedTitleAppBar

import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedTitleAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final List<String> titles;

  const AnimatedTitleAppBar({
    super.key,
    required this.titles,
  });

  @override
  State<AnimatedTitleAppBar> createState() => _AnimatedTitleAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AnimatedTitleAppBarState extends State<AnimatedTitleAppBar> {
  late int _currentIndex;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.titles.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black38,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          final isCurrent = child.key == ValueKey(widget.titles[_currentIndex]);

          final offsetAnimation = Tween<Offset>(
            begin: isCurrent ? const Offset(0, -1) : const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);

          return ClipRect(
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        child: Text(
          widget.titles[_currentIndex],
          key: ValueKey<String>(widget.titles[_currentIndex]),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
