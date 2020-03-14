// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RejectItemStore on _RejectItemStore, Store {
  final _$valueAtom = Atom(name: '_RejectItemStore.value');

  @override
  CommonOption get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(CommonOption value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_RejectItemStoreActionController =
      ActionController(name: '_RejectItemStore');

  @override
  void setReasonOption(CommonOption option) {
    final _$actionInfo = _$_RejectItemStoreActionController.startAction();
    try {
      return super.setReasonOption(option);
    } finally {
      _$_RejectItemStoreActionController.endAction(_$actionInfo);
    }
  }
}
