// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SampleStore on _SampleStore, Store {
  late final _$sampleListAtom =
      Atom(name: '_SampleStore.sampleList', context: context);

  @override
  ObservableList<Sample> get sampleList {
    _$sampleListAtom.reportRead();
    return super.sampleList;
  }

  @override
  set sampleList(ObservableList<Sample> value) {
    _$sampleListAtom.reportWrite(value, super.sampleList, () {
      super.sampleList = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SampleStore.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
sampleList: ${sampleList}
    ''';
  }
}
