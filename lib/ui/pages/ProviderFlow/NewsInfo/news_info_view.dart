import 'package:flutter/material.dart';
import 'package:soc/models/news_model.dart';
import 'package:soc/ui/widgets/smart_widgets/NewsItem/news_item_view.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

import 'news_info_view_model.dart';

class NewsInfoView extends StatelessWidget {
  const NewsInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsInfoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildScreenTitle(),
              buildNewsList(model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NewsInfoViewModel(),
    );
  }

  Widget buildScreenTitle() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "News/Info",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget buildNewsList(NewsInfoViewModel model) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => index == 0
            ? buildMainNews()
            : buildNewsItem(
                model: model,
                newsItem: NewsModel(),
                margin: EdgeInsets.fromLTRB(
                  16,
                  index == 1 ? 16 : 8,
                  16,
                  index == 6 ? 16 : 8,
                ),
              ),
      ),
    );
  }

  Widget buildMainNews() {
    return Container(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFFFF4B61),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/images/circle_image_border.png",
              height: getProportionateScreenHeight(132),
              width: getProportionateScreenHeight(132),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Lorem Ipsum dolor sit amet, consectetur",
                  maxLines: 2,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "+ See more",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNewsItem(
      {required NewsInfoViewModel model,
      required NewsModel newsItem,
      required EdgeInsets margin}) {
    return Padding(
        padding: margin,
        child: NewsItemView(
          newsItem: newsItem,
          showDate: true,
        ));
  }
}
