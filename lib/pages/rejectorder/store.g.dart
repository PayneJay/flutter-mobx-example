// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RejectOrderStore on _RejectOrderStore, Store {
  final _$groupValueAtom = Atom(name: '_RejectOrderStore.groupValue');

  @override
  CommonOption get groupValue {
    _$groupValueAtom.context.enforceReadPolicy(_$groupValueAtom);
    _$groupValueAtom.reportObserved();
    return super.groupValue;
  }

  @override
  set groupValue(CommonOption value) {
    _$groupValueAtom.context.conditionallyRunInAction(() {
      super.groupValue = value;
      _$groupValueAtom.reportChanged();
    }, _$groupValueAtom, name: '${_$groupValueAtom.name}_set');
  }

  final _$otherReasonAtom = Atom(name: '_RejectOrderStore.otherReason');

  @override
  String get otherReason {
    _$otherReasonAtom.context.enforceReadPolicy(_$otherReasonAtom);
    _$otherReasonAtom.reportObserved();
    return super.otherReason;
  }

  @override
  set otherReason(String value) {
    _$otherReasonAtom.context.conditionallyRunInAction(() {
      super.otherReason = value;
      _$otherReasonAtom.reportChanged();
    }, _$otherReasonAtom, name: '${_$otherReasonAtom.name}_set');
  }

  final _$_RejectOrderStoreActionController =
      ActionController(name: '_RejectOrderStore');

  @override
  void setGroupValue(CommonOption value) {
    final _$actionInfo = _$_RejectOrderStoreActionController.startAction();
    try {
      return super.setGroupValue(value);
    } finally {
      _$_RejectOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOtherReason(String reason) {
    final _$actionInfo = _$_RejectOrderStoreActionController.startAction();
    try {
      return super.setOtherReason(reason);
    } finally {
      _$_RejectOrderStoreActionController.endAction(_$actionInfo);
    }
  }
}
