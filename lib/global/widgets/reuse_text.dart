import '../../constants/app_imports.dart';

class ReuseText extends StatelessWidget {
  const ReuseText({
    super.key,
    this.weight = FontWeight.normal,
    this.size = 15,
    this.color = Colors.black,
    required this.title,
    this.decoration = TextDecoration.none,
    this.maxLines,
    this.linesSpace,
    this.textAlign
  });

  final FontWeight weight;
  final double size;
  final Color color;
  final String title;
  final TextDecoration decoration;
  final int? maxLines;
  final double? linesSpace;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
          height: linesSpace,
          fontFamily: "Poppins",
          decoration: decoration,
          decorationColor: color,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }
}
