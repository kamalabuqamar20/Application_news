import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile_listview.dart';

import '../models/articles_model.dart';
import '../service/news_service.dart';

class NewsTileViewBuilder extends StatefulWidget {
  const NewsTileViewBuilder({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<NewsTileViewBuilder> createState() => _NewsTileViewBuilderState();
}

class _NewsTileViewBuilderState extends State<NewsTileViewBuilder> {
  var builder;
  @override
  void initState() {
    super.initState();
    builder = NewsService().getGeneralNews(nameCategory: widget.categoryName);
  }

  // List<ArticleModel> artecle = [];

  // Future<void> methGetGeneralNews() async {
  //   // Provider.of<ArticleProvider>(context, listen: false).setArticle =
  //   //     await Provider.of<ArticleProvider>(context)

  //   artecle = await NewsService().getGeneralNews();
  //   isLoading = false;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: builder,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsTileListView(
              artecle: snapshot.data ?? [],
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('opps error in selver'),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
    // isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       )
    //     : ;
  }
}
