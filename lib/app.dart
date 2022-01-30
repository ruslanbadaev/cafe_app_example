import 'package:cafe_app_example/utils/constants/colors.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'pages/home/home.dart';
import 'pages/menu/menu.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Row(
              children: [
                Icon(
                  Icons.eco_rounded,
                  color: AppColors.PRIMARY,
                ),
                Text(
                  'Example Cafe',
                  style: TextStyle(color: AppColors.PRIMARY),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                Home(),
                Menu(),
                Menu(),
                Menu(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.record_voice_over_rounded,
              color: AppColors.PRIMARY,
            ),
            backgroundColor: Colors.white,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BubbleBottomBar(
            opacity: .2,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 8,
            fabLocation: BubbleBottomBarFabLocation.end, //new
            hasNotch: true,
            hasInk: true,
            inkColor: Colors.black12,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: AppColors.PRIMARY,
                  icon: Icon(
                    Icons.notes_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  activeIcon: Icon(
                    Icons.notes_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  title: Text("Заказы")),
              BubbleBottomBarItem(
                  backgroundColor: AppColors.PRIMARY,
                  icon: Icon(
                    Icons.breakfast_dining_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  activeIcon: Icon(
                    Icons.breakfast_dining_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  title: Text("Меню")),
              BubbleBottomBarItem(
                  backgroundColor: AppColors.PRIMARY,
                  icon: Icon(
                    Icons.notifications_active_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  activeIcon: Icon(
                    Icons.notifications_active_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  title: Text("Новости")),
              BubbleBottomBarItem(
                  backgroundColor: AppColors.PRIMARY,
                  icon: Icon(
                    Icons.settings_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  activeIcon: Icon(
                    Icons.settings_rounded,
                    color: AppColors.PRIMARY,
                  ),
                  title: Text("Настройки"))
            ],
          ),
        );
      },
    );
  }
}
