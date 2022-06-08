import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String bookCover;

  const Book({
    @required this.title,
    @required this.author,
    @required this.bookCover,
  });
}

final shelf = const <Book>[
  Book(
    title: 'Creative Hustle',
    author: 'Ramen Albert',
    bookCover: 'images/Book_2.png'
  ),
  Book(
      title: 'Art Unleashed',
      author: 'Stefano Milik',
      bookCover: 'images/Book_1.png'
  ),
  Book(
      title: 'The Ninth Life',
      author: 'Taylor B. Barton',
      bookCover: 'images/Book_5.png'
  ),
];
