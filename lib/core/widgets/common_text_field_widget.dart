// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'common_text_widget.dart';
//
// class CommonTextFieldWidget extends StatefulWidget {
//   final String labelText;
//   final String? hintText;
//   final TextEditingController? controller;
//   final bool? isPassword;
//   final Icon? icon;
//   final Widget? iconWidget;
//   final bool isFilledWhite;
//   final void Function(String text)? onChanged;
//   final bool isEditable;
//   final Color? borderClr;
//   final bool withLabel;
//   final bool? isValidator;
//   final bool isNumber;
//   final int maxWords;
//   final bool showClearIcon;
//   final int? minLines;
//   final int? maxLines;
//   final TextInputType? keyboardType;
//   final Key? textFieldkey;
//   final void Function(String text)? onSubmitted;
//
//   const CommonTextFieldWidget({
//     super.key,
//     required this.labelText,
//     this.textFieldkey,
//     this.hintText,
//     this.controller,
//     this.isPassword = false,
//     this.icon,
//     this.isFilledWhite = false,
//     this.isValidator,
//     this.onChanged,
//     this.isNumber = false,
//     this.isEditable = true,
//     this.withLabel = false,
//     this.maxWords = 25,
//     this.borderClr,
//     this.showClearIcon = false,
//     this.iconWidget,
//     this.minLines,
//     this.maxLines,
//     this.keyboardType,
//     this.onSubmitted,
//   });
//
//   @override
//   State<CommonTextFieldWidget> createState() => _CommonTextFieldWidgetState();
// }
//
// class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
//   bool passwordVisible = false;
//
//   final GlobalKey subSetStateKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.showClearIcon) {
//       widget.controller?.addListener(() {
//         subSetStateKey.currentState?.setState(() {});
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (widget.withLabel) ...[
//             CommonTextWidget(
//               text: widget.labelText.capitalizeFirstOfEach(),
//               style: bodyMedium,
//             ),
//             smallDivider,
//           ],
//           IgnorePointer(
//             ignoring: widget.isEditable ? false : true,
//             child: Stack(
//               children: [
//                 TextFormField(
//                   key: widget.textFieldkey,
//                   controller: widget.controller,
//                   readOnly: !widget.isEditable,
//                   obscureText:
//                       widget.isPassword == true ? !passwordVisible : false,
//                   enableSuggestions: widget.isPassword ?? true,
//                   autocorrect: widget.isPassword ?? true,
//                   onFieldSubmitted: widget.onSubmitted,
//                   validator: widget.isValidator == true
//                       ? (value) {
//                           if (value == null || value.isEmpty) {
//                             return '${context.l10n.please_enter} ${(widget.hintText ?? widget.labelText)} '
//                                 .capitalizeFirstOfEach();
//                           }
//
//                           if (widget.keyboardType ==
//                                   TextInputType.emailAddress &&
//                               !EmailValidator.validate(value)) {
//                             return context.l10n.invalidEmail
//                                 .capitalizeFirstOfEach();
//                           }
//
//                           return null;
//                         }
//                       : null,
//                   cursorColor: AppColors.black,
//                   style: TextStyle(
//                     color: !widget.isFilledWhite
//                         ? AppColors.black
//                         : Colors.black.withOpacity(0.9),
//                     fontSize: 16,
//                   ),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: widget.isFilledWhite
//                         ? AppColors.white
//                         : AppColors.offWhite,
//                     prefixIcon: widget.iconWidget ?? widget.icon,
//                     prefixIconConstraints: widget.iconWidget != null
//                         ? const BoxConstraints(
//                             minWidth: 21,
//                             minHeight: 21,
//                             maxHeight: 48,
//                             maxWidth: 48,
//                           )
//                         : null,
//                     // suffixIcon: (widget.isPassword ?? false)
//                     //     ? _visibilityIcon()
//                     //     : _clearIcon(),
//                     hintText: widget.hintText ?? widget.labelText,
//                     hintStyle: bodyMedium.copyWith(
//                       color: AppColors.lightModeText,
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                       left: 14.0,
//                       bottom: 8.0,
//                       top: 8.0,
//                       right: 14.0,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: widget.borderClr ?? AppColors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: widget.borderClr ?? Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   inputFormatters: [
//                     if (widget.isNumber)
//                       FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//
//                     // remove start white space
//                     FilteringTextInputFormatter.deny(RegExp(r'^\s+')),
//
//                     // length limit
//                     LengthLimitingTextInputFormatter(widget.maxWords),
//                   ],
//                   keyboardType: widget.isNumber
//                       ? TextInputType.number
//                       : widget.keyboardType ?? TextInputType.emailAddress,
//                   onChanged: (value) => widget.onChanged?.call(value),
//                   minLines: widget.minLines,
//                   maxLines: widget.isPassword == true ? 1 : widget.maxLines,
//                 ),
//                 StatefulBuilder(
//                   key: subSetStateKey,
//                   builder: (ctx, subSetState) {
//                     return Positioned(
//                       right: 3,
//                       top: 0,
//                       bottom: 0,
//                       child: (widget.isPassword ?? false)
//                           ? _visibilityIcon()
//                           : _clearIcon(),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Returns clear icon if the text field is not empty
//   Widget _clearIcon() {
//     return Visibility.maintain(
//       visible: ((widget.controller?.text.trim().isNotEmpty ?? false) &&
//           widget.showClearIcon),
//       child: IconButton(
//         hoverColor: Colors.transparent,
//         onPressed: () {
//           widget.controller?.clear();
//           widget.onChanged?.call(context.l10n.clearTextField);
//         },
//         icon: const Icon(
//           Icons.cancel,
//           color: AppColors.gray,
//         ),
//         tooltip: context.l10n.clear,
//       ),
//     );
//   }
//
//   /// Handles visibility of password if the field [widget.isPassword] is true
//   Widget _visibilityIcon() => passwordVisible == true
//       ? IconButton(
//           icon: const Icon(
//             Icons.visibility_off,
//             color: AppColors.black,
//           ),
//           onPressed: () {
//             // Update the state i.e. toggle the state of passwordVisible variable
//             passwordVisible = !passwordVisible;
//             setState(() {});
//           },
//         )
//       : IconButton(
//           icon: const Icon(
//             Icons.visibility,
//             color: AppColors.black,
//           ),
//           onPressed: () {
//             // Update the state i.e. toggle the state of passwordVisible variable
//             passwordVisible = !passwordVisible;
//             setState(() {});
//           },
//         );
// }
