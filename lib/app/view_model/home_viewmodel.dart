import 'package:projeto_livraria_estrela_branca/app/data/book_model.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_repository.dart';

class HomeViewmodel {
  final _bookRepository = BookRepository();

  List<BookModel> getBooks() {
    return _bookRepository.getBooks();
  }
}
