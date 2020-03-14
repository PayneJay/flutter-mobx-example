// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ModifyLockPwdStore on _ModifyLockPwdStore, Store {
  final _$passwordAtom = Atom(name: '_ModifyLockPwdStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$isCheckedAtom = Atom(name: '_ModifyLockPwdStore.isChecked');

  @override
  bool get isChecked {
    _$isCheckedAtom.context.enforceReadPolicy(_$isCheckedAtom);
    _$isCheckedAtom.reportObserved();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.context.conditionallyRunInAction(() {
      super.isChecked = value;
      _$isCheckedAtom.reportChanged();
    }, _$isCheckedAtom, name: '${_$isCheckedAtom.name}_set');
  }

  final _$_ModifyLockPwdStoreActionController =
      ActionController(name: '_ModifyLockPwdStore');

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_ModifyLockPwdStoreActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_ModifyLockPwdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChecked(bool checked) {
    final _$actionInfo = _$_ModifyLockPwdStoreActionController.startAction();
    try {
      return super.setChecked(checked);
    } finally {
      _$_ModifyLockPwdStoreActionController.endAction(_$actionInfo);
    }
  }
}
