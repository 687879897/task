
import 'package:flutter/material.dart';

class ErrorVeiw extends StatelessWidget {
  const ErrorVeiw({
    super.key,
    required this.error,
    required this.refresh
  });

  final String error;
  final Function? refresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(error)),
        Center(
          child: ElevatedButton(
            onPressed: () {
              refresh?.call();
            },
            child: const Text("Refresh"),
          ),
        ),
      ],
    );
  }

}