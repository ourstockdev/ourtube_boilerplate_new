import 'package:ourtube_boilerplate/ui/common/helper/paging_helper.dart';

abstract class BaseNoParamPagingUseCase<RESPONSE> {
  Future<List<RESPONSE>> call(PageLog page);
}
