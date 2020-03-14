// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$inputTextAtom = Atom(name: '_SearchStore.inputText');

  @override
  String get inputText {
    _$inputTextAtom.context.enforceReadPolicy(_$inputTextAtom);
    _$inputTextAtom.reportObserved();
    return super.inputText;
  }

  @override
  set inputText(String value) {
    _$inputTextAtom.context.conditionallyRunInAction(() {
      super.inputText = value;
      _$inputTextAtom.reportChanged();
    }, _$inputTextAtom, name: '${_$inputTextAtom.name}_set');
  }

  final _$showDelIconAtom = Atom(name: '_SearchStore.showDelIcon');

  @override
  bool get showDelIcon {
    _$showDelIconAtom.context.enforceReadPolicy(_$showDelIconAtom);
    _$showDelIconAtom.reportObserved();
    return super.showDelIcon;
  }

  @override
  set showDelIcon(bool value) {
    _$showDelIconAtom.context.conditionallyRunInAction(() {
      super.showDelIcon = value;
      _$showDelIconAtom.reportChanged();
    }, _$showDelIconAtom, name: '${_$showDelIconAtom.name}_set');
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  void setInputText(String value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction();
    try {
      return super.setInputText(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowDel(bool value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction();
    try {
      return super.setShowDel(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }
}
