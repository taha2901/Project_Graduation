// import 'package:diabetes/views/Doctor.dart';
// import 'package:diabetes/views/follow_activities.dart';
// import 'package:diabetes/views/social_screen.dart';
// import 'package:diabetes/widgets/barcode.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import '../views/profile_screen.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//   static String id = 'BottomNav';
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   String? userEmail; 

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     // الحصول على البريد الإلكتروني عند تغيير التاب
//     userEmail = ModalRoute.of(context)!.settings.arguments as String?;
//   }

//   List<Widget> _buildScreens() {
//     return [
//       HomePage(
//         userEmaill: userEmail!,
//       ),
//       const Doctor(),
//       const SocialScreen(),
//       const ProfileScreen(),
//       Barcode(),
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.home),
//         title: "Home",
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.bag),
//         title: "Activity",
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.shopping_cart),
//         title: "Social",
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.favorite_border),
//         title: "Profile",
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.profile_circled),
//         title: "Barcode",
//         activeColorPrimary: CupertinoColors.activeBlue,
//         inactiveColorPrimary: CupertinoColors.systemGrey,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _bottomNavBar = PersistentTabController();
//     return Scaffold(
//       body: PersistentTabView(
//         context,
//         controller: _bottomNavBar,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         backgroundColor: Colors.white, // Default is Colors.white.
//         handleAndroidBackButtonPress: true, // Default is true.
//         resizeToAvoidBottomInset:
//             true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//         stateManagement: true, // Default is true.
//         hideNavigationBarWhenKeyboardShows:
//             true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           colorBehindNavBar: Colors.white,
//         ),
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: ItemAnimationProperties(
//           // Navigation Bar's items animation properties.
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimation(
//           // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle:
//             NavBarStyle.style3, // Choose the nav bar style with this property.
//       ),
//     );
//   }
// }
