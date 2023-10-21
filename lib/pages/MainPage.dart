import 'package:audioreader/pages/AllAudioPage.dart';
import 'package:audioreader/pages/LibraryPage.dart';
import 'package:audioreader/pages/SettingsPage.dart';
import 'package:audioreader/services/ThemeService.dart';
import 'package:audioreader/widgets/CreateOptionMenu.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            page = index;
          });
        },
        children: const [LibraryPage(), AllAudioPage(), SettingsPage()],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: ThemeService.navBarBg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// Library button
            ElevatedButton(
              onPressed: () {
                pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll<double>(0),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(ThemeService.navBarBg)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(page == 0 ? Icons.book_rounded : Icons.book_outlined,
                      color: ThemeService.navBarIcon),
                  Text("Library",
                      style: TextStyle(
                          color: ThemeService.navBarText, fontSize: 12))
                ],
              ),
            ),

            /// Create button
            ElevatedButton(
              onPressed: () => showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const CreateOptionMenu(),
                  transitionBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          SlideTransition(
                              transformHitTests: false,
                              position: Tween<Offset>(
                                begin: const Offset(0.0, 1.0),
                                end: Offset.zero,
                              )
                                  .chain(CurveTween(curve: Curves.linear))
                                  .animate(animation),
                              child: child),
                  transitionDuration: const Duration(milliseconds: 300)),
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll<double>(0),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(ThemeService.navBarBg)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline_outlined,
                      color: ThemeService.navBarIcon),
                  Text("Create",
                      style: TextStyle(
                          color: ThemeService.navBarText, fontSize: 12))
                ],
              ),
            ),

            /// All media button
            ElevatedButton(
              onPressed: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll<double>(0),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(ThemeService.navBarBg)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      page == 1
                          ? Icons.headphones_rounded
                          : Icons.headphones_outlined,
                      color: ThemeService.navBarIcon),
                  Text("All Files",
                      style: TextStyle(
                          color: ThemeService.navBarText, fontSize: 12))
                ],
              ),
            ),

            /// Settings button
            ElevatedButton(
              onPressed: () {
                pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll<double>(0),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(ThemeService.navBarBg)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(page == 2 ? Icons.settings : Icons.settings_outlined,
                      color: ThemeService.navBarIcon),
                  Text("Settings",
                      style: TextStyle(
                          color: ThemeService.navBarText, fontSize: 12))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
