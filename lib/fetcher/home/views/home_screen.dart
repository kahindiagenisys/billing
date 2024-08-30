import 'package:auto_route/auto_route.dart';
import 'package:billingapp/fetcher/home/view_data/view_data.dart';
import 'package:billingapp/res/constant.dart';
import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.height,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Hello, Dear",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _storeDetail(),
              15.height,
              Flexible(
                flex: 1,
                child: GridView.builder(
                  itemCount: homeGridValue.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.sp,
                    mainAxisSpacing: 10.sp,
                  ),
                  itemBuilder: (context, index) {
                    return _buildItemView(homeGridValue[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _storeDetail() {
    return Container(
      height: 60.sp,
      decoration: BoxDecoration(
          color: itsGreyColor.shade100, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          12.width,
          Container(
            height: 45.sp,
            width: 45.sp,
            decoration: BoxDecoration(
              color: itsPrimaryColor.shade200,
              shape: BoxShape.circle,
            ),
          ),
          12.width,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 22.sp,
                child: Text("StoreName"),
              ),
              Text("User Name")
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemView(Map<String, dynamic> gridItemValue) {
    return AppButton(
      onTap: () => gridItemValue['onTap'](context),
      color: gridItemValue["color"],
      padding: EdgeInsets.zero,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            gridItemValue["icon"],
            size: 30.sp,
            color: Colors.black54,
          ),
          10.height,
          Text(
            gridItemValue["title"],
            style: _itemTextStyle,
          )
        ],
      ),
    );
  }

  TextStyle get _itemTextStyle => TextStyle(
        fontSize: 16.sp,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      );
}
