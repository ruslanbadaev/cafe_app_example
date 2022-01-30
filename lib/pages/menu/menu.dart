import 'package:artistover/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      // height: 96,
                      // margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.WHITE,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 96,
                            width: 96,
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black, Colors.transparent],
                                ).createShader(Rect.fromLTRB(0, rect.height, rect.width, rect.height));
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image.network(
                                'https://d2j6dbq0eux0bg.cloudfront.net/images/65414046/2667249809.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 96,
                            width: _screenWidth * .5,
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Produc Name',
                                  style: TextStyle(
                                    color: AppColors.PRIMARY,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Produc description Produc description Produc description Produc description Produc description Produc description ',
                                  style: TextStyle(
                                    color: AppColors.BLACK,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
                                ),
                                // Expanded(child: Text('Text', overflow: TextOverflow.ellipsis, maxLines: 1)),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '6\$',
                                  style: TextStyle(
                                    color: AppColors.PRIMARY,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '400г',
                                  style: TextStyle(
                                    color: AppColors.BLACK,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
