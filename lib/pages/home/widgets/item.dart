import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  int id;
  String name;
  int count;
  ItemWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.count,
  }) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.count}x ',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          widget.name,
        ),
      ],
    );
  }
}
