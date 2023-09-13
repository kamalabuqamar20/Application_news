import 'package:flutter/material.dart';

import '../widgets/newstileviewbuilder.dart';

class ViewCategory extends StatelessWidget {
  const ViewCategory({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const Icon( Icons.arrow_back) , color: Colors.black,),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Cloud',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          physics:const BouncingScrollPhysics(),
          slivers: [
            NewsTileViewBuilder(
              categoryName: category,
            ),
          ],
        ),
      ),
    );
  }
}
