import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../utils/app_colors.dart';
import 'portfolio_view.dart';
import 'empty_view.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  MainController get controller {
    try {
      return Get.find<MainController>();
    } catch (e) {
      return Get.put(MainController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return EmptyView(title: 'Home');
          case 1:
            return PortfolioView();
          case 2:
            return EmptyView(title: 'Input');
          case 3:
            return EmptyView(title: 'Profile');
          default:
            return PortfolioView();
        }
      }),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.navBarBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Home', 'assets/icons/home.svg'),
            _buildNavItem(1, 'Portfolio', 'assets/icons/portfolio.svg'),
            _buildNavItem(2, 'Input', 'assets/icons/input.svg'),
            _buildNavItem(3, 'Profile', 'assets/icons/profile.svg'),
          ],
        );
      }),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeTabIndex(index),
      child: Container(
        width: 60.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryOrange
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 8.h),

            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primaryOrange
                    : AppColors.inactiveNavColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.primaryOrange
                    : AppColors.inactiveNavColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
