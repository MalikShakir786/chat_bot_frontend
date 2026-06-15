import 'package:chat_bot_frontend/modules/home/views/chat_view.dart';
import 'package:chat_bot_frontend/modules/home/views/home_view.dart';

import '../../../constants/app_imports.dart';

class BottomNavItem {
  final String title;
  final String selectedIcon;
  final String unselectedIcon;
  final Widget screen;

  BottomNavItem({
    required this.title,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.screen,
  });
}

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int currentIndex = 0;

  final List<BottomNavItem> items = [
    BottomNavItem(
      title: "Home",
      selectedIcon: AppAssets.homeFilled,
      unselectedIcon: AppAssets.homeOutlined,
      screen: HomeView(),
    ),
    BottomNavItem(
      title: "Chat",
      selectedIcon: AppAssets.chatFilled,
      unselectedIcon: AppAssets.chatOutlined,
      screen: ChatView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: currentIndex,
              children: items.map((e) => e.screen).toList(),
            ),
            Align(
              alignment: AlignmentGeometry.bottomEnd,
              child: Container(
                margin: EdgeInsets.all(10.sp),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(items.length, (index) {
                    final isSelected = currentIndex == index;
                    final item = items[index];
        
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 16.w : 0,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              isSelected ? item.unselectedIcon : item.selectedIcon,
                              height: 26.h,
                              width: 26.w,
                              color: isSelected? AppColors.primary: Colors.white,
                            ),
        
                            if (isSelected) ...[
                              const SizedBox(width: 8),
                              ReuseText(
                                title: item.title,
                                weight: FontWeight.w600,
                                size: 12.sp,
                                color: AppColors.primary,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
