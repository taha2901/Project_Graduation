import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
          color: const Color(0xFFAAAAAA),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, top: 7, bottom: 7),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                const Spacer(),
                const Column(
                  children: [
                    Text('علي سيد'),
                    Text('ساعه 22'),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    child: Image.asset('assets/images/Ellipse 4.jpg'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "التحكم في مرض السكري رحلة وليس جهدًا فرديًا. احط نفسك بأشخاص إيجابيين ومشجعين، سواء أكانت عائلتك أو أصدقاءك أو مجموعة دعم مرضى السكري. دعمهم سيساعدك على البقاء متحفزًا ومعتمدًا على نفسك في رحلة التحكم في مرض السكري",
              textAlign: TextAlign.right,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("مشاركه"),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("تعليق"),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.comment))
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("اعجاب"),
                        IconButton(
                          icon: isFavorite
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                          color: Colors.black,
                          iconSize: 19,
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
