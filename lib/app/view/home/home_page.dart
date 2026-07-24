import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_livraria_estrela_branca/app/view/home/widgets/book.card.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_states.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewmodel = HomeViewModel();

  @override
  void initState() {
    viewmodel.getBooks();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
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
          Observer(
            builder: (context) {
              log('build carrinho');

              return Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.white),
                  Text(
                    viewmodel.shoppingCart.length.toString(),

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
              Observer(
                builder: (context) {
                  log('build livros');
                  if (viewmodel.state is LoadingState) {
                    return CircularProgressIndicator();
                  }
                  if (viewmodel.state is ErrorState) {
                    return Text((viewmodel.state as ErrorState).errorMessage);
                  }
                  if (viewmodel.state is SuccessState) {
                    final books = (viewmodel.state as SuccessState).books;
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
