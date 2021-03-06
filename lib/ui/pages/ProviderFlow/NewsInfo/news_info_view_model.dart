import 'package:soc/app/app.router.dart';
import 'package:soc/models/news_model.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class NewsInfoViewModel extends AppViewModel {
  void openNewsDetails(NewsModel newsModel) {
    navigationService.navigateTo(
      Routes.newsInfoDetailsView,
      arguments: NewsInfoDetailsViewArguments(newsModel: newsModel),
    );
  }
}
