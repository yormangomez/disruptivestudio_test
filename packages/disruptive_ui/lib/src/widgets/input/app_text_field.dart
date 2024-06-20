import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.label,
    this.hintText,
    this.maxLines,
    this.onChanged,
    this.isDisabled = false,
    this.isObscureText = false,
    this.autocorrect = true,
    this.validator,
    this.controller,
    this.autoFillHints,
    this.inputFormatters,
    this.prefixRoute,
    this.suffixIconData,
    this.keyboardType,
    this.tapSuffixIcon,
    this.tapPrefixIcon,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool isDisabled;
  final bool isObscureText;
  final Function(String)? validator;
  final TextEditingController? controller;
  final bool autocorrect;
  final Iterable<String>? autoFillHints;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixRoute;
  final IconData? suffixIconData;
  final TextInputType? keyboardType;
  final Function? tapSuffixIcon;
  final Function? tapPrefixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _textFocusNode = FocusNode();
  bool _hasError = false;
  String _text = '';
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _textFocusNode.addListener(_onFocusChange);
    _text = widget.controller?.text ?? '';
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _text = widget.controller?.text ?? '';
  }

  @override
  void dispose() {
    _textFocusNode.removeListener(_onFocusChange);
    _textFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
                  color: _hasError
                      ? AppColors.error
                      : _textFocusNode.hasPrimaryFocus
                          ? AppColors.primary
                          : _text.isNotEmpty
                              ? AppColors.black
                              : AppColors.grey4,
                ),
              )
            : const SizedBox(),
        widget.label != null
            ? const SizedBox(
                height: AppSpacing.sm,
              )
            : const SizedBox(),
        widget.maxLines != null
            ? TextFormField(
                focusNode: _textFocusNode,
                controller: widget.controller,
                validator: widget.validator != null
                    ? (e) {
                        final validation = widget.validator!(e ?? '');

                        if (validation != null) {
                          _hasError = true;
                          _errorText = validation;
                        } else {
                          _hasError = false;
                          _errorText = '';
                        }
                        setState(() {});

                        return validation;
                      }
                    : null,
                maxLines: widget.maxLines,
                autocorrect: widget.autocorrect,
                enabled: !widget.isDisabled,
                autofillHints: widget.autoFillHints,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                onTap: () {
                  setState(() {
                    _textFocusNode.requestFocus();
                  });
                },
                onTapOutside: (_) {
                  setState(() {
                    _textFocusNode.unfocus();
                  });
                },
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                  setState(() {
                    _text = value;
                  });
                },
                cursorColor: _hasError ? AppColors.error : AppColors.primary,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      widget.isDisabled ? AppColors.grey1 : AppColors.white,
                  hintText: widget.hintText,
                  hintStyle: UITextStyle.paragraphs.paragraph1Regular.copyWith(
                    color: AppColors.grey4,
                  ),
                  hoverColor: AppColors.grey2,
                  contentPadding: kIsWeb
                      ? const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        )
                      : const EdgeInsets.all(16),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.grey4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color:
                          _text.isNotEmpty ? AppColors.black : AppColors.grey4,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  prefixIcon: widget.prefixRoute != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10, left: 16),
                          child: SvgPicture.asset(
                            widget.prefixRoute!,
                            colorFilter: ColorFilter.mode(
                              _hasError
                                  ? AppColors.error
                                  : _textFocusNode.hasPrimaryFocus
                                      ? AppColors.primary
                                      : _text.isNotEmpty
                                          ? AppColors.black
                                          : AppColors.grey4,
                              BlendMode.srcIn,
                            ),
                          ),
                        )
                      : null,
                  suffixIcon: widget.suffixIconData != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 16),
                          child: Icon(
                            widget.suffixIconData,
                            size: 30.0,
                            color: _hasError
                                ? AppColors.error
                                : _textFocusNode.hasPrimaryFocus
                                    ? AppColors.primary
                                    : _text.isNotEmpty
                                        ? AppColors.black
                                        : AppColors.grey4,
                          ),
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                  prefixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                ),
              )
            : TextFormField(
                focusNode: _textFocusNode,
                controller: widget.controller,
                validator: widget.validator != null
                    ? (e) {
                        final validation = widget.validator!(e ?? '');

                        if (validation != null) {
                          _hasError = true;
                          _errorText = validation;
                        } else {
                          _hasError = false;
                          _errorText = '';
                        }
                        setState(() {});

                        return null;
                      }
                    : null,
                obscureText: widget.isObscureText,
                autocorrect: widget.autocorrect,
                enabled: !widget.isDisabled,
                autofillHints: widget.autoFillHints,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                onTap: () {
                  setState(() {
                    _textFocusNode.requestFocus();
                  });
                },
                onTapOutside: (_) {
                  setState(() {
                    _textFocusNode.unfocus();
                  });
                },
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                  setState(() {
                    _text = value;
                  });
                },
                cursorColor: _hasError ? AppColors.error : AppColors.primary,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      widget.isDisabled ? AppColors.grey1 : AppColors.white,
                  hintText: widget.hintText,
                  hintStyle: UITextStyle.paragraphs.paragraph1Regular.copyWith(
                    color: AppColors.grey4,
                  ),
                  isDense: true,
                  hoverColor: AppColors.grey2,
                  contentPadding: kIsWeb
                      ? const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        )
                      : const EdgeInsets.all(16),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.grey4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primary
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.grey4,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primary
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.grey4,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                    ),
                  ),
                  prefixIcon: widget.prefixRoute != null
                      ? GestureDetector(
                          onTap: () {
                            if (widget.tapPrefixIcon != null) {
                              widget.tapPrefixIcon!();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 16),
                            child: SvgPicture.asset(
                              widget.prefixRoute!,
                              colorFilter: ColorFilter.mode(
                                _hasError
                                    ? AppColors.error
                                    : _textFocusNode.hasPrimaryFocus
                                        ? AppColors.primary
                                        : _text.isNotEmpty
                                            ? AppColors.black
                                            : AppColors.grey4,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      : null,
                  suffixIcon: widget.suffixIconData != null
                      ? GestureDetector(
                          onTap: () {
                            if (widget.tapSuffixIcon != null) {
                              widget.tapSuffixIcon!();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 16),
                            child: Icon(
                              widget.suffixIconData,
                              size: 30.0,
                              color: _hasError
                                  ? AppColors.grey1
                                  : _textFocusNode.hasPrimaryFocus
                                      ? AppColors.primary
                                      : _text.isNotEmpty
                                          ? AppColors.black
                                          : AppColors.grey1,
                            ),
                          ),
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                  prefixIconConstraints: const BoxConstraints.tightFor(
                    width: 50,
                    height: 30,
                  ),
                ),
              ),
        _errorText.isNotEmpty
            ? const SizedBox(
                height: AppSpacing.sm,
              )
            : const SizedBox(),
        _errorText.isNotEmpty
            ? Row(
                children: [
                  _hasError
                      ? SvgPicture.asset(
                          'lib/assets/icons/alert-circle.svg',
                          package: 'swiss_ui',
                          colorFilter: const ColorFilter.mode(
                            AppColors.error,
                            BlendMode.srcIn,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(width: _hasError ? 8 : 0),
                  Text(
                    _errorText,
                    style: UITextStyle.captions.captionMedium.copyWith(
                      color: _hasError
                          ? AppColors.error
                          : _textFocusNode.hasPrimaryFocus
                              ? AppColors.primary
                              : _text.isNotEmpty
                                  ? AppColors.black
                                  : AppColors.grey4,
                      height: 1,
                    ),
                  ),
                ],
              )
            : const SizedBox(height: 24),
      ],
    );
  }
}
