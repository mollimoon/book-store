import 'package:book_store/books_parameters.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedBook extends StatefulWidget {
  final Book book;

  SelectedBook({
    Key key,
    @required this.book,
  }) : super(key: key);

  @override
  _SelectedBookState createState() => _SelectedBookState();
}

class _SelectedBookState extends State<SelectedBook> {
  double _raiting = 0.0; //овтечает за итоговое значение

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //позволяет убрать эпп бар
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0XFF404853),
        ),
        title: Text(''),
        actions: [
          Icon(
            Icons.bookmark_sharp,
          ), //favorite
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,

        elevation: 0.0, //remove shadow
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFf3e7dd), //0xFFf3e7dd
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context)
                                  .padding
                                  .top), //расч расст под бар
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFA38E8C8F).withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 20,
                                    offset: Offset(6.0, 8.0),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                widget.book.bookCover,
                                width: 174,
                                height: 245,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              widget.book.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              widget.book.author,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25, top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmoothStarRating(
                                    allowHalfRating: true,
                                    onRated: (value) {
                                      //в вэлью приходит значение от выбора звезд; onRated its callback
                                      setState(() {
                                        _raiting =
                                            value; //правое знач присваивается левому
                                      });
                                    },
                                    starCount: 5,
                                    rating:
                                        _raiting, //пробрас знач-е в сам виджет
                                    size: 30.0,
                                    color: Color(0xFF413B89),
                                    borderColor: Colors.white,
                                    spacing: 0.50),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '$_raiting',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '/5.0',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 19, bottom: 6, right: 33),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFFF2F2F2),
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 32,
                                    ),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 32, top: 6),
                                    child: Text(
                                      'Dean on Branding presents in a compact form the '
                                      'twenty essential principles of branding that will lead to the creation of strong brands....',
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 27, bottom: 20),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton(
                                      onPressed: null,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.dehaze,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'Preview',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: null,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.messenger_outline,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'Reviews',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: null,
                              child: Text(
                                'Buy Now For \$29.67',
                                style: TextStyle(
                                  color: Color(0xFFEECEE7),
                                  fontSize: 18,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xFF413B89),
                                ),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.only(top: 18, bottom: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
