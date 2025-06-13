import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final RxInt selectedIndex;
  final Function(int) onTabSelected;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Obx(() {
                bool isSelected = selectedIndex.value == index;
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected
                            ? AppColors.primaryOrange
                            : Colors.transparent,
                        width: 2.h,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      tab,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? AppColors.primaryOrange
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }).toList(),
      ),
    );
  }
}
