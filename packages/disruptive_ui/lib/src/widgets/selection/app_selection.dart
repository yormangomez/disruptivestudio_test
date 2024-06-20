import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class AppSelection extends StatefulWidget {
  const AppSelection._({
    required this.typeSelection,
    bool? valueCheckbox,
    Function(bool)? onChanged,
    String? label,
    TextStyle? textStyle,
    super.key,
  })  : _onChanged = onChanged,
        _valueCheckbox = valueCheckbox ?? false,
        _label = label,
        _textStyle = textStyle;

  const AppSelection.checkbox({
    Key? key,
    bool? valueCheckbox,
    Function(bool)? onChanged,
    String? label,
    TextStyle? textStyle,
  }) : this._(
          key: key,
          valueCheckbox: valueCheckbox,
          onChanged: onChanged,
          typeSelection: TypeSelection.checkbox,
          label: label,
          textStyle: textStyle,
        );

  const AppSelection.radio({
    Key? key,
  }) : this._(
          key: key,
          typeSelection: TypeSelection.radio,
        );

  final TypeSelection typeSelection;

  final String? _label;
  final bool _valueCheckbox;
  final Function(bool)? _onChanged;
  final TextStyle? _textStyle;

  @override
  State<AppSelection> createState() => _AppSelectionState();
}

class _AppSelectionState extends State<AppSelection> {
  final List<String> listOption = ['Option 1', 'Option 2'];

  final String currentOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    switch (widget.typeSelection) {
      case TypeSelection.checkbox:
        return Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                fillColor: widget._onChanged != null
                    ? MaterialStateProperty.all(widget._valueCheckbox
                        ? AppColors.primary
                        : AppColors.grey1)
                    : null,
                value: widget._valueCheckbox,
                checkColor: AppColors.white,
                onChanged: (value) {
                  if (widget._onChanged != null) {
                    widget._onChanged!(value!);
                    setState(() {});
                  }
                },
              ),
            ),
            SizedBox(width: widget._label != null ? 8 : 0),
            widget._label != null
                ? Text(
                    widget._label!,
                    style: widget._textStyle ??
                        UITextStyle.paragraphs.paragraph2Regular.copyWith(
                          color: AppColors.grey1,
                        ),
                  )
                : const SizedBox(),
          ],
        );
      case TypeSelection.radio:
        return RadioListTile(
          title: Text(
            'Natural',
            style: UITextStyle.paragraphs.paragraph2Regular.copyWith(
              color: AppColors.grey1,
            ),
          ),
          value: listOption[0],
          fillColor: MaterialStateProperty.all(AppColors.primary),
          groupValue: currentOption,
          onChanged: (value) {},
        );
    }
  }
}

enum TypeSelection { checkbox, radio }
