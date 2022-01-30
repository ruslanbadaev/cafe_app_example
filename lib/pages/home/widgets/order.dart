import 'package:artistover/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../models/item.dart';
import 'item.dart';

class OrderWidget extends StatefulWidget {
  int id;
  String status;
  List<ItemModel> items;
  OrderWidget({
    Key? key,
    required this.id,
    required this.status,
    required this.items,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _showItems = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () => {
          setState(() {
            _showItems = !_showItems;
          }),
        },
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    '#',
                    style: TextStyle(
                      color: AppColors.PRIMARY,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.id.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                widget.status,
              ),
              trailing: Icon(
                _showItems ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
              ),
            ),
            if (_showItems)
              Card(
                elevation: 0,
                color: AppColors.PRIMARY!.withOpacity(.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      for (ItemModel item in widget.items)
                        ItemWidget(
                          id: item.id,
                          name: item.name,
                          count: item.count,
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
