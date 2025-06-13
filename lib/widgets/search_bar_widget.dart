import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search a project',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: const Color.fromARGB(255, 44, 40, 40),
          ),
          suffixIcon: SizedBox(
            width: 28.w,
            height: 28.h,
            child: Image(image: AssetImage('assets/icons/search_icon.jpg')),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
          ).copyWith(left: 16.w),
        ),
      ),
    );
  }
}
