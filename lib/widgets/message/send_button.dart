import 'package:flutter/material.dart';
import 'package:ksu_app/constants/app_constants.dart';

class SendButton extends StatelessWidget {
  final bool isProcessing;
  final VoidCallback? onPressed;

  const SendButton({
    super.key,
    required this.isProcessing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppConstants.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        icon: isProcessing
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Icon(Icons.send, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}