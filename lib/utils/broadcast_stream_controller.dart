import 'dart:async';

import 'package:ourtube_boilerplate/app/typedefs/callback.dart';

/**
 * dart 기본 [Stream] 은 한 번만 listen 할 수 있음. (여러개의 listener 등록 불가)<br/>
 * 여러개의 리스너를 등록하려면 broadcast 로 만들어야 가능함<br/>
 * <br/>
 * <Stream 을 broadcast 하게 만드는 예>
 * ```
 * final controller = StreamController<bool>.broadcast();
 * Stream<bool> get stream => controller.stream;
 *
 * 또는..
 *
 * final controller = StreamController<bool>();
 * Stream<bool> get stream => controller.stream.asBroadcastStream();
 * ```
 * <br/>
 * 매번 위와같이 쓰면 보일러플레이트 코드가 늘어나므로, 중복 코드들을 모아서 [BroadcastStreamController] 만듬<br/>
 * <br/>
 * 또한, broadcast 는 rx의 [PublishSubject] 와 같이 subscribe 시작한 이후의 이벤트만 emit 하는데,
 * 우리가 필요한건 [BehaviorSubject] 같이 subscribe 시작할 때 가장 최근 event 가 emit 되도록 하는 것.<br/>
 * 이를 위해서는 마지막 event 를 기억해두고 onListen 에서 직접 lastEvent 를 emit 해주도록 함.
 */
class BroadcastStreamController<T> {
  final _controller = StreamController<T>.broadcast();

  BroadcastStreamController();

  void add(T event) {
    _controller.sink.add(event);
  }

  Future close() async {
    await _controller.sink.close();
    await _controller.close();
    return;
  }

  Stream<T> asStream({StreamSubscriptionFunction? onListen}) {
    return _controller.stream.asBroadcastStream(onListen: onListen);
  }
}
