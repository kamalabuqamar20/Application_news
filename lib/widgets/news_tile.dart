import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/pages/news_web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      WebViewController  controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(articleModel.url??''));
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsWebView(controller: controller)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
             child: SizedBox(
               width: double.infinity,
               height: 200,
               child: CachedNetworkImage(
                     imageUrl:  articleModel.image?? '',
                     fit: BoxFit.cover,
                     placeholder: (context, url) =>const Center(child:  CircularProgressIndicator()),
                     errorWidget: (context, url, error) =>const Icon(Icons.error),
                  ),
             ),
             
             
             // articleModel.image == null
            //     ? const Center(child: CircularProgressIndicator())
            //     : Image.network(
            //         articleModel.image!,
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //         height: 200,
            //       ),
          ),
          Text(
            articleModel.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
