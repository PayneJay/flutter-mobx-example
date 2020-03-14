// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkbenchStore on _WorkbenchStore, Store {
  final _$countAtom = Atom(name: '_WorkbenchStore.count');

  @override
  int get count {
    _$countAtom.context.enforceReadPolicy(_$countAtom);
    _$countAtom.reportObserved();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.context.conditionallyRunInAction(() {
      super.count = value;
      _$countAtom.reportChanged();
    }, _$countAtom, name: '${_$countAtom.name}_set');
  }

  final _$_WorkbenchStoreActionController =
      ActionController(name: '_WorkbenchStore');

  @override
  void increaseCount() {
    final _$actionInfo = _$_WorkbenchStoreActionController.startAction();
    try {
      return super.increaseCount();
    } finally {
      _$_WorkbenchStoreActionController.endAction(_$actionInfo);
    }
  }
}
