import 'package:cafe_app_example/models/product.dart';
import 'package:cafe_app_example/pages/menu/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import 'controller.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  List<ProductModel> products = [
    ProductModel(
      id: 1,
      title: 'Роллы Аляска',
      description: 'лосось, авокадо, сыр Филадельфия, кунжут',
      price: '285',
      currency: '₽',
      weight: '45г',
      imageUrl: 'https://sushi-kaluga.ru/wp-content/uploads/2018/01/ALYASKA.jpg',
      category: 'sushi',
    ),
    ProductModel(
      id: 2,
      title: 'Роллы Небраска',
      description: 'рис, Копченый лосось, сыр Креметте, зеленый лук',
      price: '225',
      currency: '₽',
      weight: '50г',
      imageUrl: 'https://eda.yandex.ru/images/1387779/f277d48cfc9eb3d42c31919228fa35dc-680x500.jpeg',
      category: 'sushi',
    ),
    ProductModel(
      id: 3,
      title: 'Роллы Калифорния',
      description: 'Самые лучшие роллы с лососем',
      price: '420',
      currency: '₽',
      weight: '70г',
      imageUrl: 'https://pivaldi.ru/wp-content/uploads/2019/05/Roll-kaliforniya.jpg',
      category: 'sushi',
    ),
  ];

  initState() {
    super.initState();
  }

  int? x;
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<MenuController>(
      init: MenuController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (ProductModel product in products)
                  ProductWidget(
                    id: product.id,
                    title: product.title,
                    description: product.description,
                    price: product.price,
                    currency: product.currency,
                    weight: product.weight,
                    imageUrl: product.imageUrl,
                    category: product.category,
                    onPressed: () => {},
                    descriptionWidth: _screenWidth * .5,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
