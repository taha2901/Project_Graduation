import 'package:diabetes/models/item_info_pageview.dart';
import 'package:diabetes/widgets/screen_of_pageview.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ScreenOfPageView extends StatelessWidget {
  ScreenOfPageView({super.key});
  static String id = 'PageView';
  final PageController _controller = PageController();
  List<ItemModel> items = const [
    ItemModel(
        'اعثر على أفضل الأطباء في منطقتك واحجز موعدًا بكل سهولة للحصول على الرعاية الصحية الممتازة التي تستحقها.',
        'assets/images/pose_2.png'),
    ItemModel('استمتع بمتابعه مستوي السكر المناسب لعيشه حياه طبيعيه ',
        'assets/images/pose_4.png'),
    ItemModel(
        'الاهتمام بالرياضه هتفيدك و تظبط مستوي السكر تابع مع مستويات الرياضه و اوصل للهدف الي يظبط مستوي السكر ',
        'assets/images/pose_6.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ScreenPageView(item: items[index]);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 60, bottom: 50),
              child: Container(
                // color: Colors.white,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: items.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.amber,
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

