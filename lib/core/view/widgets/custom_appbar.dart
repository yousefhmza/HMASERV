import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmaserv/core/extensions/num_extensions.dart';

import '../../resources/resources.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool showDefaultBackButton;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final Widget? flexibleSpace;
  final bool isDarkStatusBar;
  final double elevation;
  final double? titleSpacing;
  final double? toolbarHeight;

  const CustomAppbar({
    this.leading,
    this.showDefaultBackButton = true,
    this.title,
    this.actions,
    this.bottom,
    this.bgColor,
    this.flexibleSpace,
    this.titleSpacing,
    this.toolbarHeight,
    this.centerTitle = false,
    this.isDarkStatusBar = true,
    this.elevation = AppSize.s0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      automaticallyImplyLeading: showDefaultBackButton,
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
                child: Center(child: Row(children: actions!)),
              ),
            ]
          : null,
      backgroundColor: bgColor,
      titleSpacing: titleSpacing?.w,
      elevation: elevation,
      centerTitle: centerTitle,
      flexibleSpace: flexibleSpace,
      toolbarHeight: toolbarHeight?.h,
      bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: isDarkStatusBar ? Brightness.dark : Brightness.light,
        statusBarBrightness: isDarkStatusBar ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
