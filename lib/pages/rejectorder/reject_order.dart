export 'page.dart' show RejectOrderPage;

import 'package:flutter_mobx_example/widgets/common_option.dart';

const List<CommonOption> reasons = [
  const CommonOption(name: '全部满房', id: 1),
  const CommonOption(name: '部分满房', id: 2),
  const CommonOption(name: '价格不符', id: 3),
  const CommonOption(name: '重复订单', id: 4),
  const CommonOption(name: '需要担保', id: 5),
  const CommonOption(name: '到店时间过晚', id: 6),
  const CommonOption(name: '酒店装修/修业', id: 7),
  const CommonOption(name: '特殊要求无法满足', id: 8),
  const CommonOption(name: '其他原因', id: 0),
];
