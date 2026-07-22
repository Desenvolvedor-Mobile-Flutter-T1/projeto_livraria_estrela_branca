import 'package:flutter/material.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_repository.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_states.dart';

class HomeViewmodel extends ChangeNotifier {
  final _bookRepository = BookRepository();

  HomeViewModelState state = InitialState();

  Future<void> getBooks() async {
    try {
      state = LoadingState();
      notifyListeners();
      state = SuccessState(books: await _bookRepository.getBooks());
      notifyListeners();
    } catch (e) {
      state = ErrorState(errorMessage: 'Deu ruim');
      notifyListeners();
    }
  }
}
