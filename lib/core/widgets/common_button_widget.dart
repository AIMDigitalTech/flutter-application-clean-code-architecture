import 'package:flutter/material.dart';
import '../util/theme.dart';
import 'common_text_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final TextStyle? style;
  final Icon? prefixIcon;
  final Color? backgroundColor;
  final bool? isFilled;
  final bool isExpanded;
  final Color? textColor;
  final Icon? suffixIcon;
  final Color? foregroundColor;
  final BoxBorder? border;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? enabled;
  final bool isOutlined;
  final double fontSize;

  const CommonButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.height = buttonDefaultHeight,
    this.style,
    this.prefixIcon,
    this.backgroundColor,
    this.isExpanded = false,
    this.isFilled,
    this.suffixIcon,
    this.foregroundColor,
    this.textColor,
    this.border,
    this.width,
    this.padding,
    this.margin,
    this.enabled,
    this.isOutlined = false,
    this.fontSize = fontSizeDefault,
  });

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: IgnorePointer(
        ignoring: enabled == false,
        child: Opacity(
          opacity: enabled == false ? 0.5 : 1,
          child: Container(
            width: isExpanded ? double.infinity : width,
            height: height,
            margin: margin ?? const EdgeInsets.fromLTRB(10, 0, 10, 0),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadiusS),
              border: isOutlined
                  ? border ?? Border.all(color: primaryColor)
                  : border,
            ),
            child: ElevatedButton(
              onPressed: onTap,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadiusS),
                )),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (isOutlined) return Colors.transparent;

                    if (states.contains(MaterialState.pressed)) {
                      return backgroundColor ?? primaryColor;
                    }
                    return backgroundColor ?? primaryColor;
                  },
                ),
                elevation: MaterialStateProperty.all(0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    const SizedBox(width: kSpaceS),
                  ],
                  CommonTextWidget(
                    autoCopyText: false,
                    text: text,
                    color:
                        isOutlined ? primaryColor : textColor ?? surfaceColor,
                    fontSize: fontSize,
                  ),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: kSpaceS),
                    suffixIcon!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommonOutlinedButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? color;
  final double? height;
  final Widget? prefixIcon;
  final double? width; // Added width parameter
  final Widget? suffixIcon;
  final bool? enabled;
  final double fontSize;

  const CommonOutlinedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = primaryColor,
      this.prefixIcon,
      this.height = buttonDefaultHeight,
      this.width,
      this.suffixIcon,
      this.enabled,
      this.fontSize = fontSizeDefault});

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: IgnorePointer(
        ignoring: enabled == false,
        child: Opacity(
          opacity: enabled == false ? 0.5 : 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: height,
            width: width,
            child: OutlinedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16),
                ),
                backgroundColor: MaterialStateProperty.all(
                  enabled == false ? Colors.grey : surfaceColor,
                ),
                // fixedSize: width != null || height != null
                //     ? MaterialStateProperty.all(
                //         Size(width ?? double.infinity, height ?? 62),
                //       )
                //     : null,
                // fixedSize: height == null
                //     ? null
                //     : MaterialStateProperty.all(
                //         Size.fromHeight(height ?? 62,),
                //       ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kRadiusS),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color:
                        enabled == false ? surfaceColor : color ?? primaryColor,
                  ),
                ),
              ),
              onPressed: onTap,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    const SizedBox(width: kSpaceS),
                  ],
                  CommonTextWidget(
                    autoCopyText: false,
                    text: title,
                    color: color ?? primaryColor,
                    fontSize: fontSize,
                  ),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: kSpaceS),
                    suffixIcon!,
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
