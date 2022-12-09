import 'package:customerloan/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {Key? key,
       this.labelText,
      this.hintText,
      this.style,
      this.keyboardType,
      this.maxLength,
      this.onChanged,
      this.textEditingController,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.focusNode,
      this.floatingLabelBehavior,
      this.validator,
      this.enabled = true,
      this.readOnly = false,
      this.autofocus = false,
      this.textCapitalization = TextCapitalization.none,
      this.minLines,
      this.maxLines,
        this.hintStyle,
        this.labelStyle,
        this.textInputAction,
      this.inputFormatters})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textEditingController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final FocusNode? focusNode;
  final bool? enabled;
  final bool readOnly;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputAction? textInputAction;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  late FocusNode _focusNode;
  var hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {
        hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled,
      controller: widget.textEditingController,
      obscureText: false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabelBehavior,
        counter: Offstage(),
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.blueMainColor,
          ),
        ),
      ),
      onTap: widget.onTap,
      validator: widget.validator,
      minLines: 1,
      maxLines: 5,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
    );
  }
}
