import 'package:flutter/material.dart';
import 'package:ksu_app/constants/app_constants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasNotification;
  final VoidCallback? onNotificationTap;
  final List<Widget>? actions;
  final Widget? leading;
  
  const CustomAppBar({
    super.key,
    this.title = 'معين',
    this.hasNotification = false,
    this.onNotificationTap,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppConstants.iconColor,
      backgroundColor: AppConstants.appBarColor,
      elevation: 0,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        if (actions != null)
          ...actions!,
        Stack(
          children: [
            
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined, color: AppConstants.iconColor),
              onPressed: onNotificationTap,
            ),
            if (hasNotification)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
