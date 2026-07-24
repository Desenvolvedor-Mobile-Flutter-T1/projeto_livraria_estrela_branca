import 'package:mobx/mobx.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_model.dart';
import 'package:projeto_livraria_estrela_branca/app/data/book_repository.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_states.dart';
part 'home_viewmodel_mobx.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final _bookRepository = BookRepository();

  @observable
  double unidade = 0;

  @observable
  double preco = 0;

  @observable
  double juros = 0;

  @computed
  double get total2 => unidade * preco * juros;

  @observable
  HomeViewModelState state = InitialState();

  ObservableList<BookModel> shoppingCart = ObservableList();

  Future<void> getBooks() async {
    try {
      state = LoadingState();
      state = SuccessState(books: await _bookRepository.getBooks());
    } catch (e) {
      state = ErrorState(errorMessage: 'Deu ruim');
    }
  }

  @action
  void addBookToCart(BookModel book) {
    print('books');
    shoppingCart.add(book);
  }
}


/*


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


*/