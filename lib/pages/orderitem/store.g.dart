// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderItemStore on _OrderItemStore, Store {
  Computed<int> _$calculateStayComputed;

  @override
  int get calculateStay =>
      (_$calculateStayComputed ??= Computed<int>(() => super.calculateStay))
          .value;

  final _$orderStatusAtom = Atom(name: '_OrderItemStore.orderStatus');

  @override
  int get orderStatus {
    _$orderStatusAtom.context.enforceReadPolicy(_$orderStatusAtom);
    _$orderStatusAtom.reportObserved();
    return super.orderStatus;
  }

  @override
  set orderStatus(int value) {
    _$orderStatusAtom.context.conditionallyRunInAction(() {
      super.orderStatus = value;
      _$orderStatusAtom.reportChanged();
    }, _$orderStatusAtom, name: '${_$orderStatusAtom.name}_set');
  }

  final _$itemEntityAtom = Atom(name: '_OrderItemStore.itemEntity');

  @override
  ItemEntity get itemEntity {
    _$itemEntityAtom.context.enforceReadPolicy(_$itemEntityAtom);
    _$itemEntityAtom.reportObserved();
    return super.itemEntity;
  }

  @override
  set itemEntity(ItemEntity value) {
    _$itemEntityAtom.context.conditionallyRunInAction(() {
      super.itemEntity = value;
      _$itemEntityAtom.reportChanged();
    }, _$itemEntityAtom, name: '${_$itemEntityAtom.name}_set');
  }

  final _$_OrderItemStoreActionController =
      ActionController(name: '_OrderItemStore');

  @override
  void changeOrderStatus(int status) {
    final _$actionInfo = _$_OrderItemStoreActionController.startAction();
    try {
      return super.changeOrderStatus(status);
    } finally {
      _$_OrderItemStoreActionController.endAction(_$actionInfo);
    }
  }
}
