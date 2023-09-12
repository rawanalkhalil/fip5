import 'package:fip5/config/app_color.dart';
import 'package:fip5/screens/login/login_screen.dart';
import 'package:fip5/utils/helpers/fip5_Navigation.dart';
import 'package:fip5/utils/helpers/shared_prefs_helpers.dart';
import 'package:fip5/utils/ui/common_viewers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/cache_keys.dart';
import 'intro_page_item.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Widget> _pages = [];
  PageController controller = PageController();
  int _pageIndex = 0;
  @override
  void initState() {
    _fillPages();
    //_saveData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return _pages[index];
                  },
                  itemCount: _pages.length,
                  controller: controller,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      _pageIndex = pageIndex;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
                controller: controller, // PageController
                count: _pages.length,
                effect: WormEffect(
                    activeDotColor: AppColors.activeIndecator,
                    dotColor: AppColors.disbaleIndecator,
                    spacing: 50), // your preferred effect
                onDotClicked: (index) {}),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonViews().createButton(
                      title: "Back",
                      onPressed: () {
                        controller.animateToPage(_pageIndex - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }),
                  _pageIndex == _pages.length - 1
                      ? CommonViews()
                          .createButton(
                      title: "Done",
                      onPressed: () {
                        _saveData();
                        Fip5Navigtor.of(context).pushAndRemoveUntil(const LoginScreen());
                      }
                  )
                      : CommonViews().createButton(
                          title: "Next",
                          onPressed: () {
                            controller.animateToPage(_pageIndex + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          }),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _fillPages() {
    _pages.add(const IntroPageItem(
      title: "Test title1",
      image: "assets/intro1.jpg",
    ));
    _pages.add(const IntroPageItem(
      title: "Test title2",
      image: "assets/intro2.jpg",
    ));
    _pages.add(const IntroPageItem(
      title: "Test title3",
      image: "assets/intro3.jpg",
    ));
  }
  void _saveData() async{
   SharedPreferenceHelper()
        .save(key:CacheKeys.introKey ,value: true, type: SaveType.boolType);

  }
}
