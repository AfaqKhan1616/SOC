import 'package:soc/models/news_model.dart';
import 'package:soc/ui/pages/app_view_model.dart';

class NewsInfoDetailsViewModel extends AppViewModel{
  void onModelReady(NewsModel newsModel) {}

  void back() {
    navigationService.back();
  }
}