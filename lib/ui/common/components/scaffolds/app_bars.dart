import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

class AppBars extends AppBar {
  final AppBarTitle? titleItem;
  final AppBarIcon? leadingItem;
  final List<AppBarIcon> actionItems;

  AppBars({
    Key? key,
    required this.titleItem,
    required this.leadingItem,
    required this.actionItems,
  }) : super(
          key: key,
          leading: leadingItem?.icon,
          centerTitle: true,
          title: titleItem?.text,
          actions: [
            for (final item in actionItems) item.icon,
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );

  factory AppBars.backButton({
    String? title,
    required VoidCallback onPressBack,
    List<AppBarIcon>? actionItems,
  }) =>
      AppBars(
        titleItem: title == null ? null : AppBarTitle(title: title),
        leadingItem: AppBarIcon.back(onPress: onPressBack),
        actionItems: actionItems ?? const [],
      );
}

class SliverAppBars extends StatelessWidget {
  final AppBarTitle? titleItem;
  final AppBarIcon? leadingItem;
  final List<AppBarIcon> actionItems;
  final bool pinned;
  final bool floating;
  final bool snap;

  const SliverAppBars({
    Key? key,
    this.titleItem,
    this.leadingItem,
    this.actionItems = const [],
    this.pinned = true,
    this.floating = false,
    this.snap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: key,
      leading: leadingItem?.icon,
      centerTitle: titleItem?.centerTitle,
      title: titleItem?.text,
      pinned: pinned,
      floating: floating,
      snap: snap,
      actions: [
        for (final item in actionItems) item.icon,
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}

class AppBarTitle {
  final String title;
  final TextStyle titleStyle;
  final bool centerTitle;

  AppBarTitle({
    required this.title,
    TextStyle? titleStyle,
    this.centerTitle = true,
  }) : titleStyle = titleStyle ?? AppTextStyle.title1R1618;

  Widget get text => Text(title, style: titleStyle);
}

class AppBarIcon {
  final String assetPath;
  final VoidCallback onPress;
  final Color? color;
  final double size;

  AppBarIcon({
    required this.assetPath,
    required this.onPress,
    required this.color,
    this.size = 24,
  });

  Widget get icon => GestureDetector(
        onTap: onPress,
        child: Container(
          height: size + 32,
          padding: AppInset.all16,
          child: SvgPicture.asset(
            assetPath,
            height: size,
            color: color,
            fit: BoxFit.fitHeight,
          ),
        ),
      );

  factory AppBarIcon.ourtube() => AppBarIcon(
        assetPath: 'assets/icons/text_logo.svg',
        onPress: () {},
        color: null,
      );

  factory AppBarIcon.back({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/backarrow.svg',
        onPress: onPress,
        color: null,
      );

  factory AppBarIcon.settings({required VoidCallback onPress}) => AppBarIcon(
        assetPath: 'assets/icons/setting.svg',
        onPress: onPress,
        color: null,
      );
}
