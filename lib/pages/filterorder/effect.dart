import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/widgets/cupertinopoup/provider.dart';

import 'filter_order.dart';
import 'store.dart';
import 'tab_enum.dart';
import 'type_enum.dart';

///重置
void reset(BuildContext context, FilterOrderStore store) {
  store.setStatusValue(status[0]);
  store.setChannelValue(channels[0]);
  store.setBookingStartTime(null);
  store.setBookingEndTime(null);
  store.setCheckInStartTime(null);
  store.setCheckInEndTime(null);
  store.setCheckOutStartTime(null);
  store.setCheckOutEndTime(null);
}

///确认
void confirm(BuildContext context, FilterOrderStore store) {
  showToast(
    '${store.statusValue.name}\n${store.channelValue.name}\n预定：${store.bookingStartTime}——${store.bookingEndTime}\n入住：${store.checkInStartTime}——${store.checkInEndTime}\n离开：${store.checkOutStartTime}——${store.checkOutEndTime}',
    duration: Duration(seconds: 5),
  );
}

///根据类型设置文案
String setText(FilterOrderStore store, FilterType type) {
  switch (type) {
    case FilterType.status:
      return store.statusValue.name;
    case FilterType.channel:
      return store.channelValue.name;
    case FilterType.startTime:
      DateTime startTimeValue = getStartTime(store);
      return (startTimeValue == null)
          ? '请选择开始时间'
          : '${startTimeValue.year}-${startTimeValue.month}-${startTimeValue.day}';
    case FilterType.endTime:
      DateTime endTimeValue = getEndTime(store);
      return (endTimeValue == null)
          ? '请选择结束时间'
          : '${endTimeValue.year}-${endTimeValue.month}-${endTimeValue.day}';
  }
  return '';
}

///方法回调
void showPickerByType(
    BuildContext context, FilterOrderStore store, FilterType type) {
  switch (type) {
    case FilterType.status:
      selectStatus(context, store);
      break;
    case FilterType.channel:
      selectChannel(context, store);
      break;
    case FilterType.startTime:
      selectStartTime(context, store);
      break;
    case FilterType.endTime:
      selectEndTime(context, store);
      break;
  }
}

///状态
void selectStatus(BuildContext context, FilterOrderStore store) {
  int initialIndex = status.indexOf(store.statusValue);
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => buildProvider(
      status,
      initialIndex,
      (index) {
        showToast('value=${status[index].name}');
        store.setStatusValue(status[index]);
      },
    ),
  );
}

///渠道
void selectChannel(BuildContext context, FilterOrderStore store) {
  int initialIndex = channels.indexOf(store.channelValue);
  showCupertinoModalPopup(
    context: context,
    builder: (context) => buildProvider(
      channels,
      initialIndex,
      (index) {
        showToast('value=${channels[index].name}');
        store.setChannelValue(channels[index]);
      },
    ),
  );
}

///开始时间
void selectStartTime(BuildContext context, FilterOrderStore store) {
  DateTime startTime = getStartTime(store);
  DateTime endTime = getEndTime(store);
  DatePicker.showDatePicker(
    context,
    showTitleActions: true,
    onChanged: (date) {
      print('change $date');
    },
    onConfirm: (date) {
      if (endTime != null && date != null && date.isAfter(endTime)) {
        showToast('开始时间不能小于结束时间请重新选择');
        return;
      }
      setStartTime(store, date);
    },
    currentTime: startTime ?? DateTime.now(),
    locale: LocaleType.zh,
    theme: DatePickerTheme(
      cancelStyle: TextStyle(
        fontSize: 17,
        color: AppColors.color666666,
      ),
      doneStyle: TextStyle(
        fontSize: 17,
        color: AppColors.color58BC62,
      ),
      itemStyle: TextStyle(
        fontSize: 15,
        color: AppColors.color333333,
      ),
      itemHeight: 44,
    ),
  );
}

///结束时间
void selectEndTime(BuildContext context, FilterOrderStore store) {
  DateTime startTime = getStartTime(store);
  DateTime endTime = getEndTime(store);
  DatePicker.showDatePicker(
    context,
    showTitleActions: true,
    onChanged: (date) {
      print('change $date');
    },
    onConfirm: (date) {
      if (startTime != null && date != null && date.isBefore(startTime)) {
        showToast('开始时间不能小于结束时间请重新选择');
        return;
      }
      setEndTime(store, date);
    },
    currentTime: endTime ?? DateTime.now(),
    locale: LocaleType.zh,
    theme: DatePickerTheme(
      cancelStyle: TextStyle(
        fontSize: 17,
        color: AppColors.color666666,
      ),
      doneStyle: TextStyle(
        fontSize: 17,
        color: AppColors.color58BC62,
      ),
      itemStyle: TextStyle(
        fontSize: 15,
        color: AppColors.color333333,
      ),
      itemHeight: 44,
    ),
  );
}

///根据类型获取结束时间
DateTime getEndTime(FilterOrderStore store) {
  DateTime endTimeValue;
  if (store.timeType == TabTypeValues[TabType.booking]) {
    endTimeValue = store.bookingEndTime;
  } else if (store.timeType == TabTypeValues[TabType.checkIn]) {
    endTimeValue = store.checkInEndTime;
  } else if (store.timeType == TabTypeValues[TabType.checkOut]) {
    endTimeValue = store.checkOutEndTime;
  }
  return endTimeValue;
}

///根据类型获取开始时间
DateTime getStartTime(FilterOrderStore store) {
  DateTime startTimeValue;
  if (store.timeType == TabTypeValues[TabType.booking]) {
    startTimeValue = store.bookingStartTime;
  } else if (store.timeType == TabTypeValues[TabType.checkIn]) {
    startTimeValue = store.checkInStartTime;
  } else if (store.timeType == TabTypeValues[TabType.checkOut]) {
    startTimeValue = store.checkOutStartTime;
  }
  return startTimeValue;
}

///根据类型更新开始时间
void setStartTime(FilterOrderStore store, DateTime startTime) {
  if (store.timeType == TabTypeValues[TabType.booking]) {
    store.setBookingStartTime(startTime);
  } else if (store.timeType == TabTypeValues[TabType.checkIn]) {
    store.setCheckInStartTime(startTime);
  } else if (store.timeType == TabTypeValues[TabType.checkOut]) {
    store.setCheckOutStartTime(startTime);
  }
}

///根据类型更新结束时间
void setEndTime(FilterOrderStore store, DateTime startTime) {
  if (store.timeType == TabTypeValues[TabType.booking]) {
    store.setBookingEndTime(startTime);
  } else if (store.timeType == TabTypeValues[TabType.checkIn]) {
    store.setCheckInEndTime(startTime);
  } else if (store.timeType == TabTypeValues[TabType.checkOut]) {
    store.setCheckOutEndTime(startTime);
  }
}
