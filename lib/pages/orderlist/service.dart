import 'package:flutter_mobx_example/network/http.dart';
import 'package:flutter_mobx_example/network/interface_url.dart';

/// 请求订单列表数据
requestOrderList(Function onSuccess, {params, onFail}) {
  DioUtil.getInstance()
      .post(queryOrderList, onSuccess, params: params, errorCallBack: onFail);
}
