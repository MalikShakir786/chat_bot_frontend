import '../../constants/app_imports.dart';

class MenuItemData {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  MenuItemData({
    required this.title,
    required this.icon,
    required this.onTap,
    this.color,
  });
}

class AppAnchoredMenu {
  static void show({
    required BuildContext context,
    required GlobalKey key,
    required List<MenuItemData> items,
  }) {
    final RenderBox renderBox =
    key.currentContext!.findRenderObject() as RenderBox;

    final RenderBox overlay =
    Overlay
        .of(context)
        .context
        .findRenderObject() as RenderBox;

    final Offset position = renderBox.localToGlobal(
        Offset.zero, ancestor: overlay);

    final Size size = renderBox.size;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(
          position.dx,
          position.dy + size.height + 2.h,
          30.w,
          0,
        ),
        Offset.zero & overlay.size,
      ),
      items: items.map((item) {
        return PopupMenuItem(
          onTap: item.onTap,
          child: Row(
            children: [
              Icon(item.icon, size: 18.sp, color: item.color ?? Colors.black),
              SizedBox(width: 10.w),
              ReuseText(
                title: item.title,
                color: item.color ?? Colors.black,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}