import 'package:diabetes/widgets/post_card.dart';
import 'package:flutter/material.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return const PostCard();
    //   },
    // );

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const PostCard();
        },
        childCount: 15,
      ),
    );
  }
}
