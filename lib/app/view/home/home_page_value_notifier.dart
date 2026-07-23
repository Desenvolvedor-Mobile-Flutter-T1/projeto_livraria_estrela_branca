import 'package:flutter/material.dart';
import 'package:projeto_livraria_estrela_branca/app/view/home/widgets/book.card.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_states.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_valuenotifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewmodel viewmodel = HomeViewmodel();
  @override
  void initState() {
    viewmodel.getBooks();

    viewmodel.shoppingCart.addListener(() {
      if (viewmodel.shoppingCart.value.length > 10) {
        print('Maior que 10');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    viewmodel.shoppingCart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.star, color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Livraria Estrela branca',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          ValueListenableBuilder(
            valueListenable: viewmodel.shoppingCart,
            builder: (context, value, child) {
              return Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.white),
                  Text(
                    value.length.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: viewmodel.state,
                builder: (context, value, child) {
                  if (value is LoadingState) {
                    return CircularProgressIndicator();
                  }
                  if (value is ErrorState) {
                    return Text((viewmodel.state as ErrorState).errorMessage);
                  }
                  if (value is SuccessState) {
                    final books = value.books;
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: books
                          .map(
                            (e) => BookCard(
                              onTap: () => viewmodel.addBookToCart(e),
                              title: e.title,
                              author: e.author,
                              imageUrl: e.imageUrl,
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      //
    );
  }
}
