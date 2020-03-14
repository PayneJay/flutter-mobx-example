// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterOrderStore on _FilterOrderStore, Store {
  final _$statusValueAtom = Atom(name: '_FilterOrderStore.statusValue');

  @override
  CommonOption get statusValue {
    _$statusValueAtom.context.enforceReadPolicy(_$statusValueAtom);
    _$statusValueAtom.reportObserved();
    return super.statusValue;
  }

  @override
  set statusValue(CommonOption value) {
    _$statusValueAtom.context.conditionallyRunInAction(() {
      super.statusValue = value;
      _$statusValueAtom.reportChanged();
    }, _$statusValueAtom, name: '${_$statusValueAtom.name}_set');
  }

  final _$channelValueAtom = Atom(name: '_FilterOrderStore.channelValue');

  @override
  CommonOption get channelValue {
    _$channelValueAtom.context.enforceReadPolicy(_$channelValueAtom);
    _$channelValueAtom.reportObserved();
    return super.channelValue;
  }

  @override
  set channelValue(CommonOption value) {
    _$channelValueAtom.context.conditionallyRunInAction(() {
      super.channelValue = value;
      _$channelValueAtom.reportChanged();
    }, _$channelValueAtom, name: '${_$channelValueAtom.name}_set');
  }

  final _$bookingStartTimeAtom =
      Atom(name: '_FilterOrderStore.bookingStartTime');

  @override
  DateTime get bookingStartTime {
    _$bookingStartTimeAtom.context.enforceReadPolicy(_$bookingStartTimeAtom);
    _$bookingStartTimeAtom.reportObserved();
    return super.bookingStartTime;
  }

  @override
  set bookingStartTime(DateTime value) {
    _$bookingStartTimeAtom.context.conditionallyRunInAction(() {
      super.bookingStartTime = value;
      _$bookingStartTimeAtom.reportChanged();
    }, _$bookingStartTimeAtom, name: '${_$bookingStartTimeAtom.name}_set');
  }

  final _$bookingEndTimeAtom = Atom(name: '_FilterOrderStore.bookingEndTime');

  @override
  DateTime get bookingEndTime {
    _$bookingEndTimeAtom.context.enforceReadPolicy(_$bookingEndTimeAtom);
    _$bookingEndTimeAtom.reportObserved();
    return super.bookingEndTime;
  }

  @override
  set bookingEndTime(DateTime value) {
    _$bookingEndTimeAtom.context.conditionallyRunInAction(() {
      super.bookingEndTime = value;
      _$bookingEndTimeAtom.reportChanged();
    }, _$bookingEndTimeAtom, name: '${_$bookingEndTimeAtom.name}_set');
  }

  final _$checkInStartTimeAtom =
      Atom(name: '_FilterOrderStore.checkInStartTime');

  @override
  DateTime get checkInStartTime {
    _$checkInStartTimeAtom.context.enforceReadPolicy(_$checkInStartTimeAtom);
    _$checkInStartTimeAtom.reportObserved();
    return super.checkInStartTime;
  }

  @override
  set checkInStartTime(DateTime value) {
    _$checkInStartTimeAtom.context.conditionallyRunInAction(() {
      super.checkInStartTime = value;
      _$checkInStartTimeAtom.reportChanged();
    }, _$checkInStartTimeAtom, name: '${_$checkInStartTimeAtom.name}_set');
  }

  final _$checkInEndTimeAtom = Atom(name: '_FilterOrderStore.checkInEndTime');

  @override
  DateTime get checkInEndTime {
    _$checkInEndTimeAtom.context.enforceReadPolicy(_$checkInEndTimeAtom);
    _$checkInEndTimeAtom.reportObserved();
    return super.checkInEndTime;
  }

  @override
  set checkInEndTime(DateTime value) {
    _$checkInEndTimeAtom.context.conditionallyRunInAction(() {
      super.checkInEndTime = value;
      _$checkInEndTimeAtom.reportChanged();
    }, _$checkInEndTimeAtom, name: '${_$checkInEndTimeAtom.name}_set');
  }

  final _$checkOutStartTimeAtom =
      Atom(name: '_FilterOrderStore.checkOutStartTime');

  @override
  DateTime get checkOutStartTime {
    _$checkOutStartTimeAtom.context.enforceReadPolicy(_$checkOutStartTimeAtom);
    _$checkOutStartTimeAtom.reportObserved();
    return super.checkOutStartTime;
  }

  @override
  set checkOutStartTime(DateTime value) {
    _$checkOutStartTimeAtom.context.conditionallyRunInAction(() {
      super.checkOutStartTime = value;
      _$checkOutStartTimeAtom.reportChanged();
    }, _$checkOutStartTimeAtom, name: '${_$checkOutStartTimeAtom.name}_set');
  }

  final _$checkOutEndTimeAtom = Atom(name: '_FilterOrderStore.checkOutEndTime');

  @override
  DateTime get checkOutEndTime {
    _$checkOutEndTimeAtom.context.enforceReadPolicy(_$checkOutEndTimeAtom);
    _$checkOutEndTimeAtom.reportObserved();
    return super.checkOutEndTime;
  }

  @override
  set checkOutEndTime(DateTime value) {
    _$checkOutEndTimeAtom.context.conditionallyRunInAction(() {
      super.checkOutEndTime = value;
      _$checkOutEndTimeAtom.reportChanged();
    }, _$checkOutEndTimeAtom, name: '${_$checkOutEndTimeAtom.name}_set');
  }

  final _$timeTypeAtom = Atom(name: '_FilterOrderStore.timeType');

  @override
  int get timeType {
    _$timeTypeAtom.context.enforceReadPolicy(_$timeTypeAtom);
    _$timeTypeAtom.reportObserved();
    return super.timeType;
  }

  @override
  set timeType(int value) {
    _$timeTypeAtom.context.conditionallyRunInAction(() {
      super.timeType = value;
      _$timeTypeAtom.reportChanged();
    }, _$timeTypeAtom, name: '${_$timeTypeAtom.name}_set');
  }

  final _$_FilterOrderStoreActionController =
      ActionController(name: '_FilterOrderStore');

  @override
  void setStatusValue(CommonOption value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setStatusValue(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChannelValue(CommonOption value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setChannelValue(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBookingStartTime(DateTime value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setBookingStartTime(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBookingEndTime(DateTime value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setBookingEndTime(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckInStartTime(DateTime value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setCheckInStartTime(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckInEndTime(DateTime value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setCheckInEndTime(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckOutStartTime(DateTime value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setCheckOutStartTime(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckOutEndTime(DateTime value) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setCheckOutEndTime(value);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTimeType(int type) {
    final _$actionInfo = _$_FilterOrderStoreActionController.startAction();
    try {
      return super.setTimeType(type);
    } finally {
      _$_FilterOrderStoreActionController.endAction(_$actionInfo);
    }
  }
}
