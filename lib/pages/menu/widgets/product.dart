import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ProductWidget extends StatefulWidget {
  int id;
  String title;
  String description;
  String price;
  String currency;
  String weight;
  String imageUrl;
  String category;

  Function onPressed;
  double descriptionWidth;

  ProductWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.currency,
    required this.weight,
    required this.imageUrl,
    required this.category,
    required this.onPressed,
    required this.descriptionWidth,
  }) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
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
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 96,
                width: widget.descriptionWidth,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: AppColors.PRIMARY,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                        color: AppColors.BLACK,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
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
                      '${widget.price}${widget.currency}',
                      style: TextStyle(
                        color: AppColors.PRIMARY,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.weight,
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
    );
  }
}
