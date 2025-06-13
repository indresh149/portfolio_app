import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/project_card.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/search_bar_widget.dart';

class PortfolioView extends StatelessWidget {
  final MainController controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            _buildSearchBar(),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: Colors.white,
      child: Row(
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/icons/notification.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryOrange,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            'assets/icons/settings.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryOrange,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: CustomTabBar(
        tabs: ['Project', 'Saved', 'Shared', 'Achievement'],
        selectedIndex: controller.selectedTabIndex,
        onTabSelected: (index) => controller.changePortfolioTab(index),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: SearchBarWidget(
        onChanged: (query) => controller.updateSearchQuery(query),
      ),
    );
  }

  Widget _buildContent() {
    return Obx(() {
      if (controller.selectedTabIndex.value == 0) {
        return _buildProjectsList();
      } else {
        return Container(
          child: Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
            ),
          ),
        );
      }
    });
  }

  /// MODIFIED: Uses a Stack to float the button over the list.
  Widget _buildProjectsList() {
    return Stack(
      // Use Stack to layer widgets
      children: [
        Obx(() {
          final projects = controller.filteredProjects;

          if (projects.isEmpty) {
            return Center(
              child: Text(
                'No projects found',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            );
          }

          return ListView.builder(
            // Add padding to the bottom to ensure the last item is not hidden by the filter button.
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 80.h, // Space for the floating button
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ProjectCard(project: projects[index]),
              );
            },
          );
        }),
        // The filter button is now the second child of the Stack, floating on top.
        _buildFilterButton(),
      ],
    );
  }

  /// MODIFIED: Rebuilt as a floating button positioned at the bottom-center.
  Widget _buildFilterButton() {
    // Align positions the button within the Stack.
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        // Padding from the bottom edge to position it above the navigation bar.
        padding: EdgeInsets.only(bottom: 15.h),
        child: ElevatedButton.icon(
          onPressed: () {
            // Add your filter logic here
          },
          icon: Icon(Icons.filter_list, color: Colors.white, size: 22.sp),
          label: Text(
            'Filter',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFDF5532), // Orange color from image
            shape: StadiumBorder(), // Creates the pill shape
            elevation: 8.0, // Adds shadow for a floating effect
            shadowColor: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
          ),
        ),
      ),
    );
  }
}
