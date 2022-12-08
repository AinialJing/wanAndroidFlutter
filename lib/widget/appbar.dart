import 'package:flutter/material.dart';

appbar(String leftTitle, String rightTitle, VoidCallback rightButtonClick) {
  return AppBar(
    leading: const BackButton(),
    title: Text(
      leftTitle,
      style: const TextStyle(fontSize: 18),
    ),
    centerTitle: false,
    titleSpacing: 0,
    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );
}
