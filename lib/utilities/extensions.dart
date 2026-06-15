import '../constants/app_imports.dart';

extension InkTapExtension on Widget {
  Widget withInkTap({
    required VoidCallback? onTap,
    double borderRadius = 0,
    Color splashColor = Colors.black12,
    Color highlightColor = Colors.transparent,
    final int delay = 100,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
          Future.delayed(Duration(milliseconds: delay), onTap);
        },
        borderRadius: BorderRadius.circular(borderRadius.r),
        splashColor: splashColor,
        highlightColor: highlightColor,
        child: this,
      ),
    );
  }
}

extension UploadTimeExtension on DateTime {
  String get timeAgoOrDate {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inMinutes < 1) {
      return "Just now";
    }

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min ago";
    }

    if (difference.inHours < 24) {
      return "${difference.inHours} h ago";
    }

    // After 24 hours → show date + time
    return "${_formatDate(this)}";
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    return "$day-$month-$year $hour:$minute";
  }
}