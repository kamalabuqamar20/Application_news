import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';

import 'news_tile.dart';

class NewsTileListView extends StatefulWidget {
  const NewsTileListView({super.key, required this.artecle});
  final List<ArticleModel> artecle;
  @override
  State<NewsTileListView> createState() => _NewsTileListViewState();
}

class _NewsTileListViewState extends State<NewsTileListView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: widget.artecle.length,
      (BuildContext context, index) => Padding(
        padding: const EdgeInsets.only(top: 22),
        child: NewsTile(
          articleModel: widget.artecle[index],
        ),
      ),
    ));
  }
}
