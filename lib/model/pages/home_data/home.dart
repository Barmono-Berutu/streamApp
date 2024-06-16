import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/model/pages/home_data/discover.dart'; // Sesuaikan dengan path Anda

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sadsad",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("watch the movie", style: TextStyle(fontSize: 18)),
            ],
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          height: 300,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    });
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://image.tmdb.org/t/p/w500/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg"),
              ),
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => NotificationScreen()));
                  },
                  icon: Icon(Icons.notifications_none_rounded),
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        _WidgetTitle(
          icon: Icon(
            Icons.tv,
          ),
          title: "Discover",
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => SeeAll(
            //         judul: "Discover",
            //         consumerProv: Provider.of<Discover>(context))));
          },
        ),
        Discover(), // Make sure Discover() returns a widget
        _WidgetTitle(
          icon: Icon(
            Icons.local_fire_department,
          ),
          title: "Popular",
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => SeeAll(
            //         judul: "Popular",
            //         consumerProv: Provider.of<topRated>(context))));
          },
        ),
      ],
    ));
  }
}

class _WidgetTitle extends StatelessWidget {
  final String title;
  final Icon icon;
  final void Function()? onPressed;

  const _WidgetTitle(
      {required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
                onPressed: onPressed,
                child: Text(
                  "See All",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ))
          ],
        ),
      ),
    );
  }
}
