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
                  verticalPadding(16),
                  backButton(model),
                  verticalPadding(16),
                  title(),
                  verticalPadding(8),
                  description(),
                  verticalPadding(32),
                  image(),
                  verticalPadding(16),
                  details(),
                  verticalPadding(16),
                  moreNewsHeading(),
                  moreNews()
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NewsInfoDetailsViewModel(),
    );
  }

  Padding moreNews() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: NewsItemView(
        newsModel: NewsModel(),
      ),
    );
  }

  Align moreNewsHeading() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "More News",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text details() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus mauris enim urna a mus. Elit nulla amet, eget dui,",
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
      ),
    );
  }

  ClipRRect image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        "assets/images/news_sample_image.png",
        fit: BoxFit.cover,
        height: getProportionateScreenHeight(230),
        width: double.infinity,
      ),
    );
  }

  Text description() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus mauris enim urna a mus.",
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
      ),
    );
  }

  Text title() {
    return const Text(
      "Lorem Ipsum",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Align backButton(NewsInfoDetailsViewModel model) {
    return Align(
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
    );
  }

  Widget verticalPadding(double padding) {
    return SizedBox(
      height: padding,
    );
  }
}
