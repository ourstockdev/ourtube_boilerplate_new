import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ourtube_boilerplate/ui/common/base/base_view_model.dart';

typedef PageLoader<T> = Future<List<T>> Function(PageLog page);

class PagingHelper<T> {
  final PageLoadConfiguration config;
  final PageLoader<T> pageLoader;

  PagingHelper(this.config, this.pageLoader);

  late final PagingController controller = PagingController<int, T>(
    firstPageKey: config.firstPageKey,
    invisibleItemsThreshold: config.preloadThreshold,
  );

  late final PageLog currentPage = PageLog(key: config.firstPageKey - 1);

  void init() {
    controller.addPageRequestListener((pageKey) async {
      final items = await pageLoader.call(currentPage..key = pageKey);
      final isLastPage = items.length < currentPage.size;
      if (isLastPage) {
        controller.appendLastPage(items);
      } else {
        controller.appendPage(items, currentPage.nextKey);
      }
    });
  }

  void bindTo(BaseViewModel viewModel) {
    controller.bindTo(viewModel);
  }

  void refresh() {
    controller.refresh();
  }
}

class PageLoadConfiguration {
  final int firstPageKey;
  final int preloadThreshold;

  PageLoadConfiguration({
    this.firstPageKey = 1,
    this.preloadThreshold = 1,
  });
}

class PageLog {
  int key;
  int size;

  PageLog({
    required this.key,
    this.size = 10,
  });

  int get nextKey => key + 1;
}
