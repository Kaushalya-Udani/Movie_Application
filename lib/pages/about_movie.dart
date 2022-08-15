import 'dart:ui';

import 'package:flutter/material.dart';

import 'movie_model.dart';

class WatchMovie extends StatefulWidget {
  final MovieModel? movie;

  const WatchMovie({Key? key, this.movie}) : super(key: key);

  @override
  State<WatchMovie> createState() => _WatchMovieState();
}

class _WatchMovieState extends State<WatchMovie> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: widget.movie == null
          ? const Center(
              child: CircularProgressIndicator(
                value: 20,
              ),
            )
          : Container(
              height: height,
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
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.volume_up_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: height * 0.4,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.movie!.poster!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.7,
                            child: Text(
                              widget.movie!.title!,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.blue[900],
                                      size: 25,
                                    ),
                                    Text(
                                      '6.6',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '2017',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'USA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'English',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900],
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height * 0.07,
                                width: width * 0.5,
                                padding: EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.play_circle_fill,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    Center(
                                      child: Text(
                                        "Watch movie",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.08,
                                width: height * 0.08,
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.bookmark_outlined,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              Container(
                                height: height * 0.08,
                                width: height * 0.08,
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Genre:fantasy,action,comedy,adventure',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Genre:fantasy action adventure adventure,fantasy action comedy adventure',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          DefaultTabController(
                              length: 4, // length of tabs
                              initialIndex: 0,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    TabBar(
                                      labelColor: Colors.blue[900],
                                      unselectedLabelColor: Colors.white,
                                      labelStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      tabs: const [
                                        Tab(text: 'About'),
                                        Tab(text: 'Trailers'),
                                        Tab(text: 'Casts'),
                                        Tab(text: 'Reviews'),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                          height:
                                              height * 0.2, //height of TabBarView
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.5))),
                                          child:
                                              const TabBarView(children: <Widget>[
                                            Center(
                                              child: Text(
                                                'Cinephiles really do have a lot to savor as we enterCinephiles really do have a lot to savor as we enter the dog days of summer and the moviegoing season winds down. It is also in this exact moment, '
                                                'where we inhabit the deep breath between Hollywood spectacle’s biggest months and the',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'Cinephiles really do have a lot to savor as we enterCinephiles really do have a lot to savor as we enter the dog days of summer and the moviegoing season winds down. It is also in this exact moment, '
                                                'where we inhabit the deep breath between Hollywood spectacle’s biggest months and the',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'Cinephiles really do have a lot to savor as we enterCinephiles really do have a lot to savor as we enter the dog days of summer and the moviegoing season winds down. It is also in this exact moment, '
                                                'where we inhabit the deep breath between Hollywood spectacle’s biggest months and the',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'Cinephiles really do have a lot to savor as we enterCinephiles really do have a lot to savor as we enter the dog days of summer and the moviegoing season winds down. It is also in this exact moment, '
                                                'where we inhabit the deep breath between Hollywood spectacle’s biggest months and the',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ])),
                                    )
                                  ])),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
