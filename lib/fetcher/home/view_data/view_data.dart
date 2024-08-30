import 'package:auto_route/auto_route.dart';
import 'package:billingapp/router/app_router.gr.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> homeGridValue = [
  {
    "title": "Accounts",
    "icon": Icons.account_balance,
    "color": Colors.grey.shade200.withOpacity(0.9),
    "onTap": (BuildContext context) {}
  },
  {
    "title": "Sale",
    "icon": Icons.sim_card_alert_outlined,
    "color": Colors.blue.shade200.withOpacity(0.9),
    "onTap": (BuildContext context) {}
  },
  {
    "title": "Products",
    "icon": Icons.production_quantity_limits_sharp,
    "color": Colors.green.shade200.withOpacity(0.9),
    "onTap": (BuildContext context) {
      context.router.push(const ProductsRoute());
    }
  },
  {
    "title": "Orders",
    "icon": Icons.bookmark_border,
    "color": Colors.deepPurple.shade200.withOpacity(0.8),
    "onTap": (BuildContext context) {}
  },
];
