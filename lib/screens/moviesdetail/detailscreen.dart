import 'package:flutter/material.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/lists/upcominglist.dart';
import 'package:movie_app/models/popularmovies.dart';

class PopularDetailScreen extends StatefulWidget {
  const PopularDetailScreen({required this.detail});
  final Result detail;

  @override
  State<PopularDetailScreen> createState() => _PopularDetailScreenState();
}

class _PopularDetailScreenState extends State<PopularDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 700,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage(Strings.Baseurl + widget.detail.posterPath),
                  fit: BoxFit.cover,
                  opacity: 0.15),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 30,
                          )),
                      Text(
                        widget.detail.title,
                        textScaleFactor: 1.0,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            if (favourite.contains(widget.detail)) {
                            } else {
                              favourite.add(widget.detail);
                            }
                          });
                        },
                        icon: Icon(
                          favourite.contains(widget.detail)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80, top: 15),
                  child: Container(
                    height: 300,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                Strings.Baseurl + widget.detail.posterPath),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: SizedBox(
                    height: 25,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.detail.releaseDate.year.toString(),
                            textScaleFactor: 1.0,
                          )
                        ]),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.detail.voteAverage.toString(),
                              textScaleFactor: 1.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  "Story Line",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.detail.overview,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
