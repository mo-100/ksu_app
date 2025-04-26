import 'package:flutter/material.dart';
import 'package:ksu_app/constants/app_constants.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final Widget? icon;

  const MessageTextField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black
        )
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: AppConstants.secondaryTextColor),
              decoration: const InputDecoration(
                hintText: 'إسالني...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          if (icon != null)
            icon!,
        ],
      ),
    );
  }
}
