import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/pages/custom/refresh_component.dart';
import 'package:flutter_mobx_example/pages/orderitem/order_item.dart';
import 'package:flutter_mobx_example/widgets/empty_page.dart';
import 'order_list.dart' show choices, Choice;

import 'store.dart';
import 'effect.dart';

part 'tab_component.dart';

part 'list_component.dart';

Widget buildView(BuildContext context, OrderListStore store) =>
    OrderTabComponent(store: store);
