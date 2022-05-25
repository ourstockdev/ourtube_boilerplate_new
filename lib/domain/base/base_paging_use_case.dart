import 'package:ourtube_boilerplate/ui/common/helper/paging_helper.dart';

abstract class BasePagingUseCase<REQUEST, RESPONSE> {
  Future<List<RESPONSE>> call(REQUEST request, PageLog page);
}
