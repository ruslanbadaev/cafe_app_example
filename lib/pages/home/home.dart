import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/item.dart';
import '../../models/order.dart';
import 'controller.dart';
import 'widgets/order.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<OrderModel> orders = [
    OrderModel(
      id: 1,
      status: 'Готов',
      items: [
        ItemModel(id: 1, name: 'Пицца', count: 2),
        ItemModel(id: 2, name: 'Кола', count: 4),
        ItemModel(id: 3, name: 'Салат', count: 1),
      ],
    ),
    OrderModel(
      id: 2,
      status: 'Ожидает',
      items: [
        ItemModel(id: 1, name: 'Пицца', count: 2),
        ItemModel(id: 2, name: 'Кола', count: 4),
        ItemModel(id: 3, name: 'Салат', count: 1),
      ],
    ),
    OrderModel(
      id: 3,
      status: 'Ожидает',
      items: [
        ItemModel(id: 1, name: 'Пицца', count: 2),
        ItemModel(id: 2, name: 'Кола', count: 4),
        ItemModel(id: 3, name: 'Салат', count: 1),
      ],
    ),
  ];

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (OrderModel order in orders)
                  OrderWidget(
                    id: order.id,
                    status: order.status,
                    items: order.items,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
