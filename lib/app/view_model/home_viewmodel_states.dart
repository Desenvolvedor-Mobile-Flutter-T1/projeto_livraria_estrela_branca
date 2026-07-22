import 'package:projeto_livraria_estrela_branca/app/data/book_model.dart';

sealed class HomeViewModelState {}

final class InitialState extends HomeViewModelState {}

final class LoadingState extends HomeViewModelState {}

final class SuccessState extends HomeViewModelState {
  final List<BookModel> books;

  SuccessState({required this.books});
}

final class ErrorState extends HomeViewModelState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
