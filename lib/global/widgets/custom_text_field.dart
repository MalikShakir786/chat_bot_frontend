import '../../constants/app_imports.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboard;
  final bool enabled;
  final bool isSteric;
  final Color backgroundColor;
  final Color textColor;
  final Color fillColor;
  final Color hintColor;
  final Color iconColor;
  final Color borderColor;
  final Color labelColor;
  final double borderRadius;
  final bool iconUseOriginalColor;
  final double height;
  final double labelSize;
  final double textSize;
  final double iconSize;
  final bool isError;
  final bool readOnly;
  final int maxLines;

  final String? prefixIcon;
  final String? suffixIcon;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.label = "",
    this.isPassword = false,
    this.hint,
    this.controller,
    this.keyboard = TextInputType.text,
    this.enabled = true,
    this.isSteric = false,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.textPrimary,
    this.fillColor = Colors.transparent,
    this.hintColor = AppColors.grey,
    this.iconColor = AppColors.grey,
    this.borderColor = AppColors.grey,
    this.labelColor = AppColors.primary,
    this.borderRadius = 12,
    this.labelSize = 14,
    this.textSize = 13,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.iconUseOriginalColor = false,
    this.height = 48,
    this.iconSize = 18,
    this.isError = false,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.label,
                  style: TextStyle(
                    fontSize: widget.labelSize.sp,
                    color: widget.enabled ? widget.labelColor : Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                  ),
                ),
                if (widget.isSteric)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text(
                        '*',
                        style: TextStyle(
                          fontSize: (widget.labelSize - 1).sp,
                          color: widget.enabled ? Colors.red : Colors.black54,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
        ],

        Container(
          height: widget.maxLines == 1
              ? widget.height.h
              : ((widget.height- 17.h) * widget.maxLines).h,
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: widget.isError
                  ? Colors.red
                  : widget.enabled
                  ? widget.borderColor
                  : Colors.black54,
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboard,
            enabled: widget.enabled,
            obscureText: widget.isPassword ? obscure : false,
            obscuringCharacter: "*",
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            minLines: 1,

            style: TextStyle(
              color: widget.enabled ? widget.textColor : Colors.black54,
              fontSize: widget.textSize.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),

            validator: widget.validator,
            cursorColor: AppColors.primary,
            cursorHeight: 15.h,

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: widget.maxLines == 1 ? 6.h : 10.h,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: widget.prefixIcon != null
                  ? Image.asset(
                      widget.prefixIcon!,
                      height: widget.iconSize.h,
                      width: widget.iconSize.w,
                      color: widget.iconUseOriginalColor
                          ? null
                          : widget.enabled
                          ? widget.iconColor
                          : Colors.black54,
                    )
                  : null,

              prefixIconConstraints: BoxConstraints(
                minWidth: (widget.iconSize + 14).w,
              ),

              hintText: widget.hint ?? widget.label,
              hintStyle: TextStyle(
                fontFamily: "Poppins",
                color: widget.enabled ? widget.hintColor : Colors.black54,
                fontSize: widget.textSize.sp,
                fontWeight: FontWeight.w400,
              ),

              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () => setState(() => obscure = !obscure),
                      child: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        size: 18.sp,
                        color: widget.enabled
                            ? widget.iconColor
                            : Colors.black54,
                      ),
                    )
                  : (widget.suffixIcon != null
                        ? Image.asset(
                            widget.suffixIcon!,
                            height: widget.iconSize.h,
                            width: widget.iconSize.w,
                            color: widget.enabled
                                ? widget.iconColor
                                : Colors.black54,
                          )
                        : null),
              suffixIconConstraints: BoxConstraints(
                minWidth: (widget.iconSize + 5).w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
