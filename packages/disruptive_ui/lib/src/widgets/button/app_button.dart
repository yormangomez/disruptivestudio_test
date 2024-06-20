import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

/// {@template app_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  final TypeButton typeButton;

  /// {@macro app_button}
  const AppButton._({
    this.onPressed,
    this.onTap,
    this.iconRoute,
    bool? valueButton,
    required this.typeButton,
    required this.title,
    Color? buttonColor,
    Color? containerColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    BorderSide? borderSide,
    double? elevation,
    TextStyle? textStyle,
    Size? maximumSize,
    Size? minimumSize,
    EdgeInsets? padding,
    Color? colorTitle,
    double? radius,
    super.key,
  })  : _buttonColor = buttonColor ?? Colors.white,
        _containerColor = containerColor ?? Colors.white,
        _disabledButtonColor = disabledButtonColor ?? AppColors.grey4,
        _borderSide = borderSide,
        _foregroundColor = foregroundColor ?? AppColors.black,
        _disabledForegroundColor = disabledForegroundColor ?? AppColors.white,
        _elevation = elevation ?? 0,
        _textStyle = textStyle,
        _maximumSize = maximumSize ?? _defaultMaximumSize,
        _minimumSize = minimumSize ?? _defaultMinimumSize,
        _colorTitle = colorTitle ?? AppColors.white,
        _radius = radius ?? 8,
        _padding = padding ?? _defaultPadding;

  /// Filled black button.
  const AppButton.primay({
    Key? key,
    bool? valueButton,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    String? iconRoute,
    required String title,
    EdgeInsets? padding,
    double? radius,
  }) : this._(
          key: key,
          typeButton: TypeButton.normal,
          valueButton: valueButton,
          onPressed: onPressed,
          buttonColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: elevation,
          textStyle: textStyle,
          iconRoute: iconRoute,
          title: title,
          colorTitle: AppColors.white,
          padding: padding,
          radius: radius,
        );

  /// Filled secondary button.
  const AppButton.secondary({
    Key? key,
    bool? valueButton,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Color? disabledButtonColor,
    String? iconRoute,
    EdgeInsets? padding,
    required String title,
    double? radius,
  }) : this._(
          key: key,
          typeButton: TypeButton.normal,
          valueButton: valueButton,
          onPressed: onPressed,
          buttonColor: AppColors.transparent,
          foregroundColor: AppColors.primary,
          disabledButtonColor: disabledButtonColor ?? AppColors.transparent,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding ?? _smallPadding,
          iconRoute: iconRoute,
          title: title,
          colorTitle: AppColors.primary,
          radius: radius,
        );

  /// Filled secondary button.
  const AppButton.circular({
    Key? key,
    bool? valueButton,
    void Function()? onTap,
    double? elevation,
    TextStyle? textStyle,
    Color? containerColor,
    Color? disabledButtonColor,
    String? iconRoute,
    EdgeInsets? padding,
    required String title,
  }) : this._(
          key: key,
          typeButton: TypeButton.circular,
          valueButton: valueButton,
          onTap: onTap,
          buttonColor: AppColors.grey1,
          foregroundColor: AppColors.primary,
          containerColor: containerColor ?? AppColors.transparent,
          disabledButtonColor: disabledButtonColor ?? AppColors.transparent,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding ?? _smallPadding,
          iconRoute: iconRoute,
          title: title,
          colorTitle: AppColors.primary,
        );

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// The minimum size of the button.
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// The padding of the small variant of the button.
  static const _smallPadding = EdgeInsets.symmetric(horizontal: AppSpacing.lg);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.symmetric(vertical: AppSpacing.md);

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;
  final void Function()? onTap;

  /// A background color of the button.
  ///
  /// Defaults to [Colors.white].
  final Color _buttonColor;
  final Color _containerColor;

  /// A disabled background color of the button.
  ///
  /// Defaults to [AppColors.disabledButton].
  final Color? _disabledButtonColor;

  /// Color of the text, icons etc.
  ///
  /// Defaults to [AppColors.black].
  final Color _foregroundColor;

  /// Color of the disabled text, icons etc.
  ///
  /// Defaults to [AppColors.disabledForeground].
  final Color _disabledForegroundColor;

  /// A border of the button.
  final BorderSide? _borderSide;

  /// Elevation of the button.
  final double _elevation;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? _textStyle;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [_defaultMinimumSize].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets _padding;

  /// [Widget] displayed on the button.
  final String? iconRoute;
  final String title;
  final Color _colorTitle;
  final double _radius;

  @override
  Widget build(BuildContext context) {
    final textStyle = _textStyle ??
        UITextStyle.labels.label.copyWith(
          color: _colorTitle,
          fontSize: 16,
        );

    switch (typeButton) {
      case TypeButton.normal:
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(_maximumSize),
            padding: MaterialStateProperty.all(_padding),
            minimumSize: MaterialStateProperty.all(_minimumSize),
            textStyle: MaterialStateProperty.all(textStyle),
            backgroundColor: onPressed == null
                ? MaterialStateProperty.all(_disabledButtonColor)
                : MaterialStateProperty.all(_buttonColor),
            elevation: MaterialStateProperty.all(_elevation),
            foregroundColor: onPressed == null
                ? MaterialStateProperty.all(_disabledForegroundColor)
                : MaterialStateProperty.all(_foregroundColor),
            side: MaterialStateProperty.all(_borderSide),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_radius),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              iconRoute != null
                  ? Image.asset(
                      iconRoute!,
                      package: 'lacomer_ui',
                    )
                  : const SizedBox(),
              SizedBox(width: iconRoute != null ? AppSpacing.sm : 0),
              Text(
                title,
                style: textStyle,
              )
            ],
          ),
        );
      case TypeButton.circular:
        return Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )),
          ),
        );
    }
  }
}

enum TypeButton { normal, circular }
