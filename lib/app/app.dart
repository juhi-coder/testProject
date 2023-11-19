import 'package:stacked/stacked_annotations.dart';
import 'package:testProject/ui/views/home/homeview.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),

    // @stacked-route
  ],
)
class App {}
