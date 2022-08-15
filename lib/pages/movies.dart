import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/about_movie.dart';
import 'package:movie_app/pages/movie_model.dart';
import 'package:movie_app/pages/story.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<MovieModel>? popularMovieList;
  List<MovieModel>? actionMovieList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getdata2();
  }

  void getdata() async {
    try {
      var response =
          await Dio().get("http://www.omdbapi.com/?apikey=efb4988&s=avengers");
      var movies = (response.data["Search"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      setState(() {
        popularMovieList = movies;
      });
    } catch (e) {
      print(e);
    }
  }

  void getdata2() async {
    try {
      var response =
          await Dio().get("http://www.omdbapi.com/?apikey=efb4988&s=marvel");
      var movies = (response.data["Search"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      setState(() {
        actionMovieList = movies;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: popularMovieList == null || actionMovieList == null
          ? const Center(
              child: CircularProgressIndicator(
              value: 20,
            ))
          : Column(
              children: [
                Container(
                  height: height * 0.13,
                  width: width,
                  color: Colors.deepPurple,
                  child: Stack(
                    children: [
                      const Positioned(
                        child: Text(
                          "Movies",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        left: 25,
                        bottom: 9,
                      ),
                      Positioned(
                        child: IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        right: 60,
                        bottom: 2,
                      ),
                      Positioned(
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                        ),
                        right: 20,
                        bottom: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 9),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              height: height * 0.08,
                              width: height * 0.08,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 3.0,
                                      spreadRadius: 3.0,
                                    )
                                  ],
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/profile.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Thane Conner",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "View",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.deepPurple
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * 0.05,
                            width: width * 0.25,
                            padding: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 8),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, top: 3, bottom: 3),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "1134",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Movies",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.25,
                            padding: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 8),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, top: 3, bottom: 3),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "25",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "TV Serios",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.25,
                            padding: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 8),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, top: 3, bottom: 3),
                                  child: Column(
                                    children: const [
                                      Text(
                                        "3400",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Episodes",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.09,
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularMovieList!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              StoryPage(movie: popularMovieList![index]),));
                        },
                        child: Container(
                          height: height * 0.22,
                          width: width * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                popularMovieList![index].poster!,
                              ),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Action",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.089,
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: actionMovieList!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              StoryPage(movie: actionMovieList![index]),));
                        },
                        child: Container(
                          height: height * 0.22,
                          width: width * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                actionMovieList![index].poster!,
                              ),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final movies = [
    "Naomi",
    "Queen Sugar",
    "The White Tiger",
    "Wings of Fire",
    "Home Sweet Homes",
    "Momy Save Me",
    "Bandarawela",
    "Out of My Hand",
    "Thor",
    "Sonic",
    "Tinker Bell",
    "Brahmastra",
    "ELVIS",
    "The Princess",
  ];

  final recentMovies = [
    "Queen Sugar",
    "The White Tiger",
    "Wings of Fire",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    //actions for app bar
    //throw UnimplementedError();
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //leading icon on the left of app bar
    //throw UnimplementedError();
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, query);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    //throw UnimplementedError();
    return const StoryPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone serches for something
    //throw UnimplementedError();
    final suggestionList = query.isEmpty
        ? recentMovies
        : movies.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
