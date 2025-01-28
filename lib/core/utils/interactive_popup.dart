import 'package:flutter/material.dart';

void showInteractiveDialog(BuildContext context,
    {required String header, required Widget child}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // const Divider(
              //   height: 30,
              // ),
              child,
              // const Divider(
              //   height: 30,
              // ),
            ],
          ),
        ),
      );
    },
  );
}
