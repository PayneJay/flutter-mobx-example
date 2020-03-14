// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderListStore on _OrderListStore, Store {
  final _$currentTabAtom = Atom(name: '_OrderListStore.currentTab');

  @override
  int get currentTab {
    _$currentTabAtom.context.enforceReadPolicy(_$currentTabAtom);
    _$currentTabAtom.reportObserved();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.context.conditionallyRunInAction(() {
      super.currentTab = value;
      _$currentTabAtom.reportChanged();
    }, _$currentTabAtom, name: '${_$currentTabAtom.name}_set');
  }

  final _$_OrderListStoreActionController =
      ActionController(name: '_OrderListStore');

  @override
  void changeTab(int tab) {
    final _$actionInfo = _$_OrderListStoreActionController.startAction();
    try {
      return super.changeTab(tab);
    } finally {
      _$_OrderListStoreActionController.endAction(_$actionInfo);
    }
  }
}
