// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LockStatusStore on _LockStatusStore, Store {
  final _$lockStatusAtom = Atom(name: '_LockStatusStore.lockStatus');

  @override
  int get lockStatus {
    _$lockStatusAtom.context.enforceReadPolicy(_$lockStatusAtom);
    _$lockStatusAtom.reportObserved();
    return super.lockStatus;
  }

  @override
  set lockStatus(int value) {
    _$lockStatusAtom.context.conditionallyRunInAction(() {
      super.lockStatus = value;
      _$lockStatusAtom.reportChanged();
    }, _$lockStatusAtom, name: '${_$lockStatusAtom.name}_set');
  }

  final _$isCleanAtom = Atom(name: '_LockStatusStore.isClean');

  @override
  bool get isClean {
    _$isCleanAtom.context.enforceReadPolicy(_$isCleanAtom);
    _$isCleanAtom.reportObserved();
    return super.isClean;
  }

  @override
  set isClean(bool value) {
    _$isCleanAtom.context.conditionallyRunInAction(() {
      super.isClean = value;
      _$isCleanAtom.reportChanged();
    }, _$isCleanAtom, name: '${_$isCleanAtom.name}_set');
  }

  final _$_LockStatusStoreActionController =
      ActionController(name: '_LockStatusStore');

  @override
  void setLockStatus(int status) {
    final _$actionInfo = _$_LockStatusStoreActionController.startAction();
    try {
      return super.setLockStatus(status);
    } finally {
      _$_LockStatusStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchCleanStatus() {
    final _$actionInfo = _$_LockStatusStoreActionController.startAction();
    try {
      return super.switchCleanStatus();
    } finally {
      _$_LockStatusStoreActionController.endAction(_$actionInfo);
    }
  }
}
