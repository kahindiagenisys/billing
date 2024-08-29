import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitleView(),
        ],
      ),
    );
  }

  Widget _buildTitleView() {
    if (widget.title != null) {
      return Text(
        widget.title!,
        style: const TextStyle(
          fontSize: 18,
        ),
      );
    }
    return const SizedBox();
  }
}
