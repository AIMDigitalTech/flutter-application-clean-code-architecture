import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../util/theme.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool? isBold;
  final Color? color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final double? fontSize;
  final bool? autoCopyText;

  const CommonTextWidget({
    super.key,
    required this.text,
    this.style,
    this.isBold,
    this.color,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.fontSize,
    this.autoCopyText = true,
  });

  @override
  Widget build(BuildContext context) {
    final newStyleColor = color ?? style?.color;
    final newStyleFontSize = fontSize ?? style?.fontSize;
    final newStyleFontFamily = style?.fontFamily ?? familyFont;
    final newStyleFontWeight =
        isBold == true ? FontWeight.bold : style?.fontWeight;

    TextStyle textStyle = TextStyle(
      color: newStyleColor,
      fontSize: newStyleFontSize,
      fontFamily: newStyleFontFamily,
      fontWeight: newStyleFontWeight,
      overflow: overflow,
    );

    return autoCopyText != true
        ? Text(
            text,
            style: textStyle,
            textAlign: textAlign,
          )
        : SelectableText(
            text,
            style: textStyle,
            onSelectionChanged: (selection, cause) {
              String? selectedText = selection.textInside(text);
              Clipboard.setData(ClipboardData(text: selectedText));
            },
            textAlign: textAlign,
            // scrollPhysics: const NeverScrollableScrollPhysics(),
          );
  }
}
