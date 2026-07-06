import 'dart:async';
import 'package:flutter/material.dart';

class TypingBackspacingText extends StatefulWidget {
  final List<String> texts;
  final String prefix;
  final TextStyle? textStyle;
  final Duration typingSpeed;
  final Duration pauseDuration;
  final Duration backspaceSpeed;

  const TypingBackspacingText({
    super.key,
    required this.texts,
    this.prefix = '',
    this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 50),
    this.backspaceSpeed = const Duration(milliseconds: 30),
    this.pauseDuration = const Duration(milliseconds: 800),
  });

  @override
  State<TypingBackspacingText> createState() => _TypingBackspacingTextState();
}

class _TypingBackspacingTextState extends State<TypingBackspacingText> {
  int _textIndex = 0;
  int _charIndex = 0;
  String _displayed = '';
  bool _isTyping = true;
  Timer? _timer;

  String get _currentText => widget.texts[_textIndex];

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (_isTyping) {
        if (_charIndex < _currentText.length) {
          setState(() {
            _charIndex++;
            _displayed = widget.prefix + _currentText.substring(0, _charIndex);
          });
        } else {
          _isTyping = false;
          _timer?.cancel();
          Future.delayed(widget.pauseDuration, _startBackspacing);
        }
      }
    });
  }

  void _startBackspacing() {
    _timer = Timer.periodic(widget.backspaceSpeed, (timer) {
      if (!_isTyping) {
        if (_charIndex > 0) {
          setState(() {
            _charIndex--;
            _displayed = widget.prefix + _currentText.substring(0, _charIndex);
          });
        } else {
          _timer?.cancel();
          _textIndex = (_textIndex + 1) % widget.texts.length;
          _isTyping = true;
          Future.delayed(const Duration(milliseconds: 300), _startTyping);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_displayed|',
      style:
          widget.textStyle ??
          Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
