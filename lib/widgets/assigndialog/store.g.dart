// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssignStore on _AssignStore, Store {
  final _$isEmptyAtom = Atom(name: '_AssignStore.isEmpty');

  @override
  bool get isEmpty {
    _$isEmptyAtom.context.enforceReadPolicy(_$isEmptyAtom);
    _$isEmptyAtom.reportObserved();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.context.conditionallyRunInAction(() {
      super.isEmpty = value;
      _$isEmptyAtom.reportChanged();
    }, _$isEmptyAtom, name: '${_$isEmptyAtom.name}_set');
  }

  final _$_AssignStoreActionController = ActionController(name: '_AssignStore');

  @override
  void add(CommonOption value) {
    final _$actionInfo = _$_AssignStoreActionController.startAction();
    try {
      return super.add(value);
    } finally {
      _$_AssignStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(CommonOption value) {
    final _$actionInfo = _$_AssignStoreActionController.startAction();
    try {
      return super.remove(value);
    } finally {
      _$_AssignStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearList() {
    final _$actionInfo = _$_AssignStoreActionController.startAction();
    try {
      return super.clearList();
    } finally {
      _$_AssignStoreActionController.endAction(_$actionInfo);
    }
  }
}
