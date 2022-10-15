import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';
import '../../theme/app_font.dart';
import '../../utils/custom_button.dart';

class AdsCard extends StatelessWidget {
  const AdsCard({
    super.key,
    required this.color,
    required this.title,
    required this.content,
    required this.imageUrls,
  });

  final List<String> title;
  final List<String> content;
  final List<Color> color;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80.h,
      left: 30.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          color: Colors.transparent,
          width: 300.w,
          height: 100.h,
          child: PageView(
            children: [
              _buildContent(context, title[0], content[0], imageUrls[0],
                  color[0], Colors.white),
              _buildContent(context, title[1], content[1], imageUrls[1],
                  color[1], Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, String title, String text,
      String imageUrl, Color color, Color textColor) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.50,
          child: Container(
            color: color,
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodySmall.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                2.verticalSpace,
                Text(
                  text,
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                5.verticalSpace,
                CustomButton(
                  text: 'Get',
                  fontSize: 10,
                  textColor: Colors.black,
                  color: AppColor.buttonColor,
                  function: () {},
                  width: 50.w,
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(20.r))),
          child: Image.asset(
            imageUrl,
          ),
        )
      ],
    );
  }
}
