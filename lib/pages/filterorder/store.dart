import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_example/widgets/common_option.dart';

import 'filter_order.dart' show status, channels;

part 'store.g.dart';

class FilterOrderStore = _FilterOrderStore with _$FilterOrderStore;

abstract class _FilterOrderStore with Store {
  @observable
  CommonOption statusValue = status.first;

  @observable
  CommonOption channelValue = channels.first;

  @observable
  DateTime bookingStartTime;

  @observable
  DateTime bookingEndTime;

  @observable
  DateTime checkInStartTime;

  @observable
  DateTime checkInEndTime;

  @observable
  DateTime checkOutStartTime;

  @observable
  DateTime checkOutEndTime;

  @observable
  int timeType;

  @action
  void setStatusValue(CommonOption value) {
    statusValue = value;
  }

  @action
  void setChannelValue(CommonOption value) {
    channelValue = value;
  }

  @action
  void setBookingStartTime(DateTime value) {
    bookingStartTime = value;
  }

  @action
  void setBookingEndTime(DateTime value) {
    bookingEndTime = value;
  }

  @action
  void setCheckInStartTime(DateTime value) {
    checkInStartTime = value;
  }

  @action
  void setCheckInEndTime(DateTime value) {
    checkInEndTime = value;
  }

  @action
  void setCheckOutStartTime(DateTime value) {
    checkOutStartTime = value;
  }

  @action
  void setCheckOutEndTime(DateTime value) {
    checkOutEndTime = value;
  }

  @action
  void setTimeType(int type) {
    timeType = type;
  }
}
