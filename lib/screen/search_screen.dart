import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextBar(),
            SearchGrid(),
          ],
        ),
      ),
    );
  }
}

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: '검색',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
              contentPadding: const EdgeInsets.all(0),
              filled: true,
              fillColor: Colors.grey.shade200),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}

final gridItems = List.generate(30, (index) => Colors.amber.shade200);

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: gridItems.map((color) => Container(color: color)).toList(),
    );
  }
}
