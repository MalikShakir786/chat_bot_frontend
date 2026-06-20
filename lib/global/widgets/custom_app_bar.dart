import '../../constants/app_imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title = ''
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomIconButton(
          onTap: (){
            PrefManager.clearAll();
            Get.offAllNamed(
              Routes.LOGIN
            );
          },
          iconPath: AppAssets.menu, isBackground: false,iconColor: AppColors.primary,size: 18,),
        Expanded(child: Center(child: ReuseText(title: title, size: 15.sp, weight: FontWeight.w600, color: AppColors.primary,))),
        CustomIconButton(iconPath: AppAssets.addFiles, size: 21.sp, iconColor: AppColors.primary,)
      ],
    );
  }
}
