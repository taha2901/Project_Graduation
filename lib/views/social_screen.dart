import 'package:flutter/material.dart';
import 'package:diabetes/widgets/PersonsList.dart';
import 'package:diabetes/widgets/PostsList.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});
static String id = 'social';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Row(
            children: [
              const Text(
                'طه حماده ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset('assets/images/Ellipse 4.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ],
        leading: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 5, left: 5),
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(child: PersonsList()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            PostsList(),
          ],
        ),
      ),
    );
  }
}
