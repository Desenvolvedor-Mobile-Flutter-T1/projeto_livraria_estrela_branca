import 'package:projeto_livraria_estrela_branca/app/data/book_model.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_service.dart';

class BookRepository {
  final BookService _service = BookService();

  List<BookModel> getBooks() {
    try {
      final result = _service.getBooks();
      return result.map((e) => BookModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
