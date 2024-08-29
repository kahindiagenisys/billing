import 'package:auto_route/auto_route.dart';
import 'package:billingapp/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Home Screen Build");
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          title: "Home",
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: GridView.builder(
                itemCount: 7,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return _buildItemView();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemView() {
    return Container(
      margin: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
          color: Colors.red.shade500.withOpacity(0.8),
          borderRadius: BorderRadius.circular(6.sp)),
    );
  }
}
