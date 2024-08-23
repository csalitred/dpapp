import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.imageIcon,
    required this.selected,
  }) : super(key: key);

  final IconData imageIcon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            offset: selected ? const Offset(-3, -3) : const Offset(3, 3),
            color: Colors.black12,
            blurRadius: 3,
          ),
          BoxShadow(
            offset: selected ? const Offset(3, 3) : const Offset(-3, -3),
            color: Colors.white,
            blurRadius: 3,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          imageIcon,
          color: Colors.blueGrey,
          size: 25,
        ),
        onPressed: () {
          print('Menu tapped');
        },
      ),
    );
  }
}
