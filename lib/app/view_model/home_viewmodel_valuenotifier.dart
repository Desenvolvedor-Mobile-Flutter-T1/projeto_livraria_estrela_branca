import 'package:flutter/material.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_model.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_repository.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_states.dart';

class HomeViewmodel {
  final _bookRepository = BookRepository();

  ValueNotifier<HomeViewModelState> state = ValueNotifier(InitialState());
  ValueNotifier<List<BookModel>> shoppingCart = ValueNotifier([]);

  Future<void> getBooks() async {
    try {
      state.value = LoadingState();
      state.value = SuccessState(books: await _bookRepository.getBooks());
    } catch (e) {
      state.value = ErrorState(errorMessage: 'Deu ruim');
    }
  }

  void addBookToCart(BookModel book) {
    print('books');
    shoppingCart.value = [...shoppingCart.value, book];
  }
}
