import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_list/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* controller for search field
  final _controller = TextEditingController();

  //* main movies
  static List<MovieModel> mainMovie = [
    const MovieModel(
        movieTitle: "3 Idiots",
        movieRating: 10,
        moviePoster:
            "https://m.media-amazon.com/images/M/MV5BNTkyOGVjMGEtNmQzZi00NzFlLTlhOWQtODYyMDc2ZGJmYzFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY98_CR0,0,67,98_AL_.jpg",
        movieRelease: "2009"),
    const MovieModel(
        movieTitle: "KGF 2",
        movieRating: 9,
        moviePoster:
            "https://m.media-amazon.com/images/M/MV5BNWRlYTAyZDQtZmQ5Yi00ZTUzLTljZDMtYjcwZTgyMDIwOGRiXkEyXkFqcGdeQXVyMTUwMDg3OTQy._V1_UY98_CR1,0,67,98_AL_.jpg",
        movieRelease: "2022"),
    const MovieModel(
        movieTitle: "Eega",
        movieRating: 8,
        moviePoster:
            "https://m.media-amazon.com/images/M/MV5BMjFmZjYwNGUtYzE1NC00YTllLThmZDctODc3NDExYTY3NTM3XkEyXkFqcGdeQXVyOTk3NTc2MzE@._V1_UX67_CR0,0,67,98_AL_.jpg",
        movieRelease: "2016"),
  ];

  //* use this list to filter search results
  List<MovieModel> secMovie = List.from(mainMovie);

  final myTextTheme = GoogleFonts.notoSerif(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  //* update function
  void updateList(String value) {
    setState(() {
      secMovie = mainMovie
          .where(
            (element) => element.movieTitle.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* bg color
      backgroundColor: Colors.brown.shade200,

      //* app bar
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "List Search",
          style: GoogleFonts.notoSerif(color: Colors.black),
        ),
        centerTitle: true,
      ),

      //* body
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),

            //* search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                onChanged: (value) => updateList(value),
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Search by Movie Title",
                  hintStyle: GoogleFonts.notoSerif(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear_sharp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _controller.clear();
                      }),
                  fillColor: const Color.fromARGB(95, 119, 68, 50),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            //* List view
            Expanded(
              child: ListView.builder(
                  itemCount: secMovie.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(
                        secMovie[index].movieTitle,
                        style: myTextTheme,
                      ),
                      subtitle: Text(
                        secMovie[index].movieRelease,
                        style: myTextTheme,
                      ),
                      trailing: Text(
                        secMovie[index].movieRating.toString(),
                        style: myTextTheme,
                      ),
                      leading: Image.network(secMovie[index].moviePoster),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
