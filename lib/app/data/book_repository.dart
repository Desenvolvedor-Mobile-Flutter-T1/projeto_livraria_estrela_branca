import 'package:projeto_livraria_estrela_branca/app/data/book_model.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_service.dart';

class BookRepository {
  final BookService _service = BookService();

  Future<List<BookModel>> getBooks() async {
    try {
      final result = await _service.getBooks();
      return result.map((e) => BookModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
