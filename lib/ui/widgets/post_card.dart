import 'package:bloc_api/core/constants/screen_utilities.dart';
import 'package:bloc_api/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.productName,
    required this.productDesc,
  }) : super(key: key);

  final String productName;
  final String productDesc;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            ///List  of Product widgets

            kHeight(3.h),

            Text(
              productName,
              style: normalTextStyle.copyWith(
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            kHeight(1.h),
            Text(
              productDesc,
              style: normalTextStyle2.copyWith(
                fontSize: 15.px,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
