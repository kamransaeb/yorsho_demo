import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../widgets/svg_icon.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';
import '../../core/constants/assets_icons/assets_icons.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppDimensions.circularBorderRadius)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(10);
  SnakeShape snakeShape = SnakeShape.circle;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;
  Color selectedColor = AppTheme.primaryColor;
  Color unselectedColor = AppTheme.greyColor5;
  int pageIndex = 0;
  Key key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      key: _scaffoldKey,
      body:
          // SafeArea(
          //   child:
          widget.child,
      //),
      bottomNavigationBar: SnakeNavigationBar.color(
        key: key,
        backgroundColor: AppTheme.whiteColor,
        //shadowColor: blackColor,
        elevation: 3,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: Platform.isIOS
            ? const EdgeInsets.only(left: 10, right: 10)
            : const EdgeInsets.all(10),
        snakeViewColor: Theme.of(context).primaryColor,
        selectedItemColor: snakeShape == SnakeShape.indicator
            ? selectedColor
            : null,
        unselectedItemColor: AppTheme.greyColor3,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationHomeFilled,
              size: 27,
              color: AppTheme.whiteColor,
            ),
            icon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationHome,
              size: 30,
              color: AppTheme.greyColor1,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationFavoritesFilled,
              size: 27,
              color: AppTheme.whiteColor,
            ),
            icon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationFavorites,
              size: 30,
              color: AppTheme.greyColor1,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationStarsFilled,
              size: 27,
              color: AppTheme.whiteColor,
            ),
            icon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationStars,
              size: 30,
              color: AppTheme.greyColor1,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationBasketFilled,
              size: 27,
              color: AppTheme.whiteColor,
            ),
            icon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationBasket,
              size: 30,
              color: AppTheme.greyColor1,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationProfileFilled,
              size: 27,
              color: AppTheme.whiteColor,
            ),
            icon: SvgIcon(
              shadow: false,
              asset: AssetsIcons.bottomNavigationProfile,
              size: 30,
              color: AppTheme.greyColor1,
            ),
          ),
        ],
      ),
    );
  }
}
