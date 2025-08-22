import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/config/theme/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomTextFormField extends StatefulWidget {
  final double? width;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final String? Function(String?)? validateInput;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String autofillHints;
  final int? maxLines;
  final bool isPassword;
  final bool enable;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? complete;
  final TextCapitalization textCapitalization;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final bool? readOnly;

  const CustomTextFormField({
    super.key,
    this.width,
    required this.controller,
    this.hint,
    this.label,
    this.validateInput,
    this.textCapitalization = TextCapitalization.words,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofillHints = AutofillHints.username,
    this.maxLines = 1,
    this.isPassword = false,
    this.enable = true,
    this.initialValue,
    this.inputFormatters,
    this.focusNode,
    this.complete,
    this.onChanged,
    this.onTap,
    this.contentPadding,
    this.readOnly,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isPasswordVisible;
  bool _isValid = false;
  bool _hasFocus = false;
  String? hasError;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.isPassword;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _validateInput(String value) {
    if (widget.validateInput != null) {
      setState(() {
        hasError = widget.validateInput!(value);
        _isValid = hasError == null;
      });
    }
  }

  Widget _buildSuffixIcon() {
    if (widget.isPassword) {
      return _buildPasswordToggleIcon();
    } else {
      return _buildValidationIcon();
    }
  }

  Widget _buildPasswordToggleIcon() {
    return IconButton(
      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: kBlue02),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }

  Widget _buildValidationIcon() {
    if (_hasFocus) {
      return _isValid ? Icon(Symbols.verified, color: kGreen) : Icon(Symbols.error, color: kRed);
    } else {
      return (hasError?.isNotEmpty ?? false) ? Icon(Symbols.error, color: kRed) : SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kBlack),
              key: widget.key,
              textCapitalization: widget.textCapitalization,
              focusNode: widget.focusNode ?? _focusNode,
              initialValue: widget.initialValue,
              enabled: widget.enable,
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              obscureText: widget.isPassword && !_isPasswordVisible,
              maxLines: widget.maxLines,
              validator: widget.validateInput,
              autofillHints: [widget.autofillHints],
              inputFormatters: widget.inputFormatters,
              onTap: widget.onTap,
              onChanged: (value) {
                _validateInput(value);
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              decoration: AppDecorations.inputDecoration(
                context: context,
                hint: widget.hint,
                label: widget.label,
                suffixIcon: _buildSuffixIcon(),
                contentPadding: widget.contentPadding,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
