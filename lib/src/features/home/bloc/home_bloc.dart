import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState()) {
    init();
  }

  init() {
    final bannerList = [
      ImageAssets.kBanner1,
      ImageAssets.kBanner2,
      ImageAssets.kBanner3,
      ImageAssets.kBanner4,
    ];

    final productList = [
      const Product(
        image: ImageAssets.kLed27,
        brand: 'LG전자 ',
        name: '스탠바이미 27ART10AKPL (스탠',
        comments: [
          '화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다.',
          '스탠바이미는 사랑입니다!',
        ],
        totalComment: 216,
        rating: 4.89,
        tags: [
          'LG전자',
          '편리성',
        ],
      ),
      const Product(
        image: ImageAssets.kLed75,
        brand: 'LG전자 ',
        name: '울트라HD 75UP8300KNA (스탠드)',
        comments: [
          '화면 잘 나오고... 리모컨 기능 좋습니다.',
          '넷플 아마존 등 버튼하나로 바로 접속 되고디스플레이는 액정문제 없어보이고소리는 살짝 약간 감이 있으나 ^^; 시끄러울까봐 그냥 블루투스 헤드폰 구매 예정이라 문제는 없네요. 아주 만족입니다!!',
        ],
        totalComment: 136,
        rating: 4.36,
        tags: [
          'LG전자',
          '고화질',
        ],
      ),
      const Product(
        image: ImageAssets.kLed40,
        brand: '라익미 ',
        name: '스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)',
        comments: [
          '반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면 차고 넘칠만 합니다',
          '중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어 OTT 서비스에 오픈 브라우저 까지 너무 마음에 들게끔 기능들을 사용 가능했고',
        ],
        totalComment: 98,
        rating: 3.98,
        tags: [
          '라익미',
          '가성비',
        ],
      ),
    ];

    productList.sort(
      (a, b) => b.rating.compareTo(a.rating),
    );

    final userList = [
      const User(
          avatar: ImageAssets.kAvatar1,
          name: 'Name01',
          rank: 1,
          totalReview: 35,
          note: '조립컴 업체를 운영하며 리뷰를 작성합니다.'),
      const User(
        avatar: ImageAssets.kAvatar2,
        name: 'Name02',
        rank: 2,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar3,
        name: 'Name03',
        rank: 3,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar4,
        name: 'Name04',
        rank: 4,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar5,
        name: 'Name05',
        rank: 5,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar6,
        name: 'Name06',
        rank: 6,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar7,
        name: 'Name07',
        rank: 7,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar8,
        name: 'Name08',
        rank: 8,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar9,
        name: 'Name09',
        rank: 9,
        totalReview: 0,
      ),
      const User(
        avatar: ImageAssets.kAvatar10,
        name: 'Name10',
        rank: 10,
        totalReview: 0,
      ),
    ];

    emit(
      state.copyWith(
        bannerList: bannerList,
        productList: productList,
        userList: userList,
      ),
    );
  }

  onChangeBannerIndex(int index) {
    emit(
      state.copyWith(
        bannerIndex: index,
      ),
    );
  }
}
