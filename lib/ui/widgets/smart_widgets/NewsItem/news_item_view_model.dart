import 'package:soc/app/app.router.dart';
import 'package:soc/models/news_model.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class NewsItemViewModel extends AppViewModel {
  late NewsModel newsModel;
  void onModelReady(NewsModel newsItem) {
    newsModel = newsItem;
  }

  void onTapNews(){
    navigationService.navigateTo(
      Routes.newsInfoDetailsView,
      arguments: NewsInfoDetailsViewArguments(newsModel: newsModel),
    );
  }
}
