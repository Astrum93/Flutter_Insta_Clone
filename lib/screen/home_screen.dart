import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StroyArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StroyArea extends StatelessWidget {
  const StroyArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(10, (index) => UserStory(userName: 'User $index')),
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String contents;

  FeedData(
      {required this.userName,
      required this.likeCount,
      required this.contents});
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, contents: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User2', likeCount: 27, contents: '오늘 아침은 맛있었다.'),
  FeedData(userName: 'User3', likeCount: 0, contents: '오늘 저녁은 맛있었다.'),
  FeedData(userName: 'User4', likeCount: 100, contents: '날이 좋다.'),
  FeedData(userName: 'User5', likeCount: 25, contents: '야식은 뭐 먹지?'),
  FeedData(userName: 'User6', likeCount: 10, contents: '오늘 맛있었다.'),
  FeedData(userName: 'User7', likeCount: 7, contents: '점심은 맛있었는데 저녁은 맛있을까?'),
  FeedData(userName: 'User8', likeCount: 56, contents: '오늘도 화이팅'),
  FeedData(userName: 'User9', likeCount: 87, contents: '얄리얄리 얄라셩 얄라리 얄라'),
];

class UserStory extends StatelessWidget {
  final String userName;
  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(userName)
        ],
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.userName)
                ],
              ),
              const Icon(Icons.more_vert)
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_outline)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: feedData.userName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const TextSpan(text: '  '),
            TextSpan(text: feedData.contents),
          ], style: const TextStyle(color: Colors.black))),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
