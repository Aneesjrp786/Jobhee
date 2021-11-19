import 'package:baby_madics/app_theme.dart';
import 'package:baby_madics/custom_drawer/drawer_user_controller.dart';
import 'package:baby_madics/custom_drawer/home_drawer.dart';
import 'package:baby_madics/screens/ProfileScreen.dart';
import 'package:baby_madics/screens/about.dart';
import 'package:baby_madics/screens/add_order_screen.dart';
import 'package:baby_madics/screens/current_orders.dart';
import 'package:baby_madics/screens/all_orders.dart';
import 'package:baby_madics/screens/help_screen.dart';
import 'package:baby_madics/screens/home_screen.dart';
import 'package:baby_madics/screens/invite_friend_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.AllOrder) {
        setState(() {
          screenView = AllOrders();
        });
      } else if (drawerIndex == DrawerIndex.AddOrder) {
        setState(() {
          screenView = AddOrder();
        });
      } else if (drawerIndex == DrawerIndex.CurrentOrder) {
        setState(() {
          screenView = CurrentOrder();
        });
      } else if (drawerIndex == DrawerIndex.PurchaseHistory) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.Profile) {
        setState(() {
          screenView = ProfileScreen();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = About();
        });
      }
      else {
        //do in your way......
      }
    }
  }
}
