import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBarView extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final double height;
  final Color? backgroundColor;

  const AppBarView({
    super.key,
    this.height = kToolbarHeight,
    this.title,
    this.backgroundColor,
  });

  @override
  State<AppBarView> createState() => _AppBarViewState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (context.canPop)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: BackButton(
                color: widget.backgroundColor == null
                    ? Colors.black87
                    : Colors.white70,
              ),
            ),
          _buildTitleView(),
        ],
      ),
    );
  }

  Widget _buildTitleView() {
    if (widget.title != null) {
      return Text(
        widget.title!,
        style: TextStyle(
            fontSize: 18.sp,
            color: widget.backgroundColor == null
                ? Colors.black87
                : Colors.white70,
            fontWeight: FontWeight.w500),
      );
    }
    return const SizedBox();
  }
}
