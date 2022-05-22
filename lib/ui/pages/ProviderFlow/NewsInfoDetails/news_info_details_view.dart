import 'package:flutter/material.dart';
import 'package:soc/models/news_model.dart';
import 'package:soc/ui/widgets/smart_widgets/NewsItem/news_item_view.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

import 'news_info_details_view_model.dart';

class NewsInfoDetailsView extends StatelessWidget {
  const NewsInfoDetailsView({Key? key, required this.newsModel})
      : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsInfoDetailsViewModel>.reactive(
      onModelReady: (m) => m.onModelReady(newsModel),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: IconButton(
                        onPressed: model.back,
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Lorem Ipsum",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus mauris enim urna a mus.",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/news_sample_image.png",
                      fit: BoxFit.cover,
                      height: getProportionateScreenHeight(230),
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus mauris enim urna a mus. Elit nulla amet, eget dui,",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "More News",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:const  EdgeInsets.symmetric(vertical: 16),
                    child: NewsItemView(
                      newsItem: NewsModel(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NewsInfoDetailsViewModel(),
    );
  }
}
