import 'package:flutter/material.dart';
import 'package:projeto_livraria_estrela_branca/app/view/home/widgets/book.card.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_changenotifier.dart';
import 'package:projeto_livraria_estrela_branca/app/view_model/home_viewmodel_states.dart';

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
    super.initState();
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListenableBuilder(
                listenable: viewmodel,
                builder: (context, child) {
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
                              onTap: () {},
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
