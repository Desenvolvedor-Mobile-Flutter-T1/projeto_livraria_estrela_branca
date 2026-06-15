import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 170,
      padding: const .all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(161, 0, 0, 0),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            clipBehavior: .antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: .circular(8),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Column(
                    mainAxisAlignment: .center,
                    children: [
                      Icon(Icons.book_rounded, size: 40, color: Colors.grey),
                      SizedBox(height: 8),
                      Padding(
                        padding: .symmetric(horizontal: 8.0),
                        child: Text(
                          'Capa indisponível',
                          textAlign: .center,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          Text(
            title,
            maxLines: 1,
            overflow: .ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            author,
            maxLines: 1,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  print('Ler mais $title');
                },
                child: Container(
                  padding: const .symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: .circular(12),
                  ),
                  child: const Text(
                    'Ler Mais',
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ),
                ),
              ),

              InkWell(
                onTap: () => print('comprar $title'),
                child: Container(
                  padding: const .symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: .circular(12),
                  ),
                  child: const Text(
                    'Comprar',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
