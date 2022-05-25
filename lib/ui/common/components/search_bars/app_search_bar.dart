import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/radius.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';
import 'package:ourtube_boilerplate/ui/common/components/common_widget.dart';
import 'package:ourtube_boilerplate/ui/common/components/search_bars/search_state.dart';

/* 2021.11.11(목) 변경사항 by 우수몽
 *
 * 1. 검색 버튼 클릭 시 검색이 되도록 수정.
 * 2. 상태값 추가 : 검색(search), 비검색(none)
 * 3. search 상태일 때 뒤로라기 버튼 추가.
 */

class AppSearchBar extends StatelessWidget {
  /* 초기에는 검색중인 상태가 아님. */
  final Rx<SearchState> state;
  /* AppSearchBar 구성요소들 */
  final TextEditingController controller;
  final VoidCallback search;
  final String? hint;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const AppSearchBar({
    Key? key,
    required this.state,
    required this.controller,
    required this.search,
    this.hint,
    this.style,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Visibility(
              visible: state.value == SearchState.search,
              child: InkWell(
                onTap: () {
                  state.value = SearchState.none;
                  controller.text = '';
                  // 키보드 dismiss
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                  margin: AppInset.right14,
                  child: SvgPicture.asset(
                    'assets/icons/backarrow.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: AppInset.vertical12 + AppInset.left16 + AppInset.right12,
                fillColor: AppColor.gray150,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.gray150,
                    width: 0,
                  ),
                  borderRadius: AppRadius.all48,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.gray150,
                    width: 0,
                  ),
                  borderRadius: AppRadius.all48,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.gray150,
                    width: 0,
                  ),
                  borderRadius: AppRadius.all48,
                ),
                hintText: hint,
                hintStyle: hintStyle ??
                    AppTextStyle.title3R1418.copyWith(color: AppColor.gray500),
                filled: true,
                isDense: true,
                suffixIcon: InkWell(
                  onTap: () {
                    if (controller.text.replaceAll(' ', '').isNotEmpty) {
                      state.value = SearchState.search;
                      search();
                    } else {
                      CommonWidget.toast('검색어를 입력해주세요.');
                    }
                  },
                  child: Container(
                    padding: AppInset.vertical12,
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: AppColor.bk,
                    ),
                  ),
                ),
              ),
              controller: controller,
              style: style ?? AppTextStyle.title3R1418,
              keyboardType: TextInputType.text,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              // 키보드에서 '검색' 버튼 클릭 시
              textInputAction: TextInputAction.search,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(FocusNode());

                if (controller.text.replaceAll(' ', '').isNotEmpty) {
                  state.value = SearchState.search;
                  search();
                } else {
                  CommonWidget.toast('검색어를 입력해주세요.');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
