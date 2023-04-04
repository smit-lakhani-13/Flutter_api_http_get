// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_HomePageStore.hasError'))
      .value;

  late final _$sampleAtom =
      Atom(name: '_HomePageStore.sample', context: context);

  @override
  List<Sample> get sample {
    _$sampleAtom.reportRead();
    return super.sample;
  }

  @override
  set sample(List<Sample> value) {
    _$sampleAtom.reportWrite(value, super.sample, () {
      super.sample = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomePageStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomePageStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_HomePageStore.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
sample: ${sample},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
hasError: ${hasError}
    ''';
  }
}
