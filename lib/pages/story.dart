import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/about_movie.dart';
import 'package:movie_app/pages/movie_model.dart';

class StoryPage extends StatefulWidget {
  final MovieModel? movie;

  const StoryPage({Key? key, this.movie}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  List<MovieModel>? popularMovieList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    try {
      var response =
          await Dio().get("http://www.omdbapi.com/?apikey=efb4988&s=disney");
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: popularMovieList == null
          ? const Center(
              child: CircularProgressIndicator(
              value: 20,
            ))
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: height * 0.5,
                            width: width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.movie!.poster!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 8),
                              child: Column(
                                children: [
                                  SizedBox(height: height * 0.08),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          alignment: Alignment.bottomLeft,
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        SizedBox(
                                          width: width * 0.7,
                                          child: Text(
                                            widget.movie!.title!,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: height * 0.22,
                                              width: width * 0.32,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    widget.movie!.poster!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.55,
                                                  child: Text(
                                                    widget.movie!.title!,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        color:
                                                            Colors.yellow[600],
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: height * 0.04,
                                                      width: width * 0.2,
                                                      padding: EdgeInsets.only(
                                                          left: 5.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      child: Container(
                                                        child: const Center(
                                                          child: Text(
                                                            "2018",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 4),
                                                      child: Text(
                                                        "Ryan Coogler",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 19),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                    'In publishing and commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be',
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Text(
                                                  "134 min",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.yellow[600],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //SizedBox(height: height * 0.01),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Action",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Container(
                                            child: const Center(
                                              child: Text(
                                                "Adventure",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Sci-fi",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'Story',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        child: SizedBox(
                          width: width,
                          child: Text(
                            'In In publishing and commonly used to demonstrate the visual form of a document or a typeface without relying on'
                            ' publishing and commonly used to demonstrate the visual form of a document or a typeface without relying on'
                            'In publishing and commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be',
                            maxLines: 5,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'More',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Related",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      SizedBox(
                        height: height * 0.20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMovieList!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                              left: 22,
                            ),
                            child: Container(
                              height: height * 0.20,
                              width: width * 0.30,
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
                    ],
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WatchMovie(movie: widget.movie),
                        ));
                      },
                      child: Container(
                        height: height * 0.06,
                        width: height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    right: 30,
                    top: 370,
                  ),
                ],
              ),
            ),
    );
  }
}
