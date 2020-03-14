// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PickerStore on _PickerStore, Store {
  final _$indexAtom = Atom(name: '_PickerStore.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$_PickerStoreActionController = ActionController(name: '_PickerStore');

  @override
  void setSelectIndex(int value) {
    final _$actionInfo = _$_PickerStoreActionController.startAction();
    try {
      return super.setSelectIndex(value);
    } finally {
      _$_PickerStoreActionController.endAction(_$actionInfo);
    }
  }
}
