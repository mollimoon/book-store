import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'books_parameters.dart';
import 'book_selected.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //то что в скафолде может заходить под эпбар
      body: SingleChildScrollView(
        //чтобы экран листался вниз
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar( //переносим чтобы он мог листаться вверх
              leading: Icon(Icons.menu,
                color: Colors.black,),
              title: Text(''),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.search, color: Color(0XFF404853),),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0, //remove shadow
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 20.0),
              child: Text('Popular Now', //noto serif
                  style: GoogleFonts.roboto(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: 250.0,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemCount: shelf.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectedBook(book: shelf[index]),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            width: 142.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('${shelf[index].bookCover}'),
                            )),
                          ),
                        ),
                        Text('${shelf[index].title}'),
                        Text('${shelf[index].author}'),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'Bestsellers',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 250.0,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemCount: shelf.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Flexible(
                        child: Container(
                          width: 142.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('${shelf[index].bookCover}'),
                          )),
                        ),
                      ),
                      Text('${shelf[index].title}'),
                      Text('${shelf[index].author}'),
                    ],
                  );

                },

                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //add different icons selected and not
        backgroundColor: Colors.white,
        showSelectedLabels: false, //hide labels
        currentIndex: 2,
        selectedItemColor: Colors.deepPurple[900],
        unselectedItemColor: Colors.grey,
        // type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.filter_alt_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
