import 'package:flutter/material.dart';
import 'package:soc/models/news_model.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

import 'news_item_view_model.dart';

class NewsItemView extends StatelessWidget {
  const NewsItemView({Key? key, required this.newsModel, this.showDate = false})
      : super(key: key);

  final NewsModel newsModel;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsItemViewModel>.reactive(
      onModelReady: (m) => m.onModelReady(newsModel),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [if (showDate) date(), verticalPadding(8), newsItem(model)],
      ),
      viewModelBuilder: () => NewsItemViewModel(),
    );
  }

  ClipRRect newsItem(NewsItemViewModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => model.onTapNews(),
          child: Container(
            height: getProportionateScreenHeight(140),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xFFC0C0C0), width: 0.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                image(),
                horizontalPadding(16),
                details(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded details() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          verticalPadding(8),
          description(),
        ],
      ),
    );
  }

  Text description() {
    return const Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus mauris enim urna a mus. Elit nulla amet, eget dui,",
      maxLines: 3,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
      ),
    );
  }

  Text title() {
    return const Text(
      "Lorem Ipsum",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  ClipRRect image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        "assets/images/news_sample_image.png",
        fit: BoxFit.cover,
        height: getProportionateScreenHeight(94),
        width: getProportionateScreenHeight(94),
      ),
    );
  }

  Text date() {
    return Text(
      newsModel.formattedDate ?? 'N/A',
      style: const TextStyle(color: Color(0xFFAAAAAA)),
    );
  }

  Widget verticalPadding(double padding) {
    return SizedBox(
      height: padding,
    );
  }
  Widget horizontalPadding(double padding) {
    return SizedBox(
      width: padding,
    );
  }
}
