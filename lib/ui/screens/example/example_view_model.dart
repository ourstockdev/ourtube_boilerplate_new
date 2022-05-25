import 'package:get/get.dart';
import 'package:ourtube_boilerplate/domain/enums/example_type.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_model.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_request_model.dart';
import 'package:ourtube_boilerplate/domain/usecases/example/post_example_use_case.dart';
import 'package:ourtube_boilerplate/ui/common/base/base_view_model.dart';

class ExampleViewModel extends BaseViewModel {
  /// 주의 : 여기서 Repository, DataSource, Api를 직접 불러오지 않도록 한다!
  ///       API 호출은 무조건 UseCase를 통해서만 하도록 한다.
  final PostExampleUseCase _useCase;

  ExampleViewModel(this._useCase);

  /// Rxn으로 쓰는 이유 : 초기에 _data가 null이면 로딩 전이고, 이후 _data에 값이 들어오면 로딩이 끝난 것으로 판별하기 위함.
  Rxn<ExampleModel> _data = Rxn();

  /// Screen이 시작될 때, 화면 빌드가 되기 전
  @override
  Future<void> onInit() async {
    super.onInit();

    // API 호출해서 값 불러오기
    final responseResult = await _useCase.call(ExampleRequestModel(reqInt: 0, type: ExampleType.type2));

    // 불러온 결과값은 Result에 들어있으므로, 이를 성공/실패에 따라 나눠서 처리
    responseResult.fold(
      onSuccess: (data) {
        // 성공 시 처리 : 여기서 data는 ExampleModel.
        // _data에 로딩으로 불러온 결과값을 넣어줌.
        _data.value = data;
      },
      onFailure: (error) {
        // 실패 시 처리 : error는 Exception.
      }
    );
  }

  /// Screen이 시작될 때, 화면 빌드가 된 이후
  @override
  void onReady() {
    super.onReady();
  }

  /// Screen이 종료될 때
  @override
  void onClose() {
    super.onClose();
  }

  /// _data의 값을 불러오는 getter.
  /// 이렇게 쓰는 이유는 2가지이다.
  /// 1. 다른 곳에서 data를 불러올 때, data.value를 이용해서 직접적으로 값을 수정하지 못하도록 막는다. (캡슐화)
  /// 2. 다른 곳에서는 data의 값만 불러와서 사용할 것이기 때문에, 일일이 data.value로 호출하는 불편함을 막는다.
  ExampleModel? get data => _data.value;
}