// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  Computed<double>? _$total2Computed;

  @override
  double get total2 => (_$total2Computed ??= Computed<double>(
    () => super.total2,
    name: 'HomeViewModelBase.total2',
  )).value;

  late final _$unidadeAtom = Atom(
    name: 'HomeViewModelBase.unidade',
    context: context,
  );

  @override
  double get unidade {
    _$unidadeAtom.reportRead();
    return super.unidade;
  }

  @override
  set unidade(double value) {
    _$unidadeAtom.reportWrite(value, super.unidade, () {
      super.unidade = value;
    });
  }

  late final _$precoAtom = Atom(
    name: 'HomeViewModelBase.preco',
    context: context,
  );

  @override
  double get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(double value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  late final _$jurosAtom = Atom(
    name: 'HomeViewModelBase.juros',
    context: context,
  );

  @override
  double get juros {
    _$jurosAtom.reportRead();
    return super.juros;
  }

  @override
  set juros(double value) {
    _$jurosAtom.reportWrite(value, super.juros, () {
      super.juros = value;
    });
  }

  late final _$stateAtom = Atom(
    name: 'HomeViewModelBase.state',
    context: context,
  );

  @override
  HomeViewModelState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeViewModelState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$HomeViewModelBaseActionController = ActionController(
    name: 'HomeViewModelBase',
    context: context,
  );

  @override
  void addBookToCart(BookModel book) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
      name: 'HomeViewModelBase.addBookToCart',
    );
    try {
      return super.addBookToCart(book);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
unidade: ${unidade},
preco: ${preco},
juros: ${juros},
state: ${state},
total2: ${total2}
    ''';
  }
}
