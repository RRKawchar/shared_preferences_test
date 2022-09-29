import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/widgets/progress_bar.dart';
import 'package:shared_prefereces_test/widgets/reuseble_text.dart';


class LoadingDialog extends StatelessWidget {
  final String? message;

  LoadingDialog({this.message});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(height: 10,),
          ReusebleText(text: "$message ,Please wait...")
        ],
      ),
    );
  }
}