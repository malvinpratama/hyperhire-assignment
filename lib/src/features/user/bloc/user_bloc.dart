import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/src/utils/utils.dart';

import '../../../models/models.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc(User user)
      : _user = user,
        super(const UserState()) {
    init();
  }

  final User _user;

  init() {
    final comments = [
      Comment(
        product: 'AMD 라이젠 5 ',
        model: '5600X 버미어 정품 멀티팩',
        rating: 4.07,
        createdAt: DateTime(2022, 12, 09),
        tag: ['“가격 저렴해요”', '“CPU온도 고온”', '“서멀작업 가능해요”', '“게임 잘 돌아가요”'],
        comments: [
          '멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.',
          '3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.'
        ],
        image: [
          ImageAssets.kProduct1,
          ImageAssets.kProduct2,
          ImageAssets.kProduct3,
        ]
      ),
    ];
    emit(
      state.copyWith(
        user: _user,
        comments: comments,
      ),
    );
  }
}
