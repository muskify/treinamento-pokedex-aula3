import 'package:flutter/material.dart';
import 'package:pokedex/settings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildListView() {
    List<PokemonListItem> children = [];
    List<Map> data = getData();

    for (int i = 0; i < data.length; i++) {
      Map pokemon = data[i];
      PokemonListItem item = PokemonListItem(
        title: pokemon['title'],
        subtitle: pokemon['subtitle'],
        url: pokemon['url'],
      );
      children.add(item);
    }

    return ListView(children: children);
  }

  List<Map> getData() {
    // Futuramente vamos pegar esses dados da uma API
    // Por agora, geramos dados fake
    List<Map> data = [];
    for (int i = 1; i < 11; i++) {
      Map pokemon = {
        'title': 'Pokemon $i',
        'subtitle': 'abc',
        'url': 'https://pokeres.bastionbot.org/images/pokemon/$i.png',
      };
      data.add(pokemon);
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.lightBlue.withOpacity(0.5),
        child: buildListView(),
      ),
    );
  }
}

class PokemonFavButton extends StatefulWidget {
  PokemonFavButton({this.title});

  final String title;

  @override
  _PokemonFavButtonState createState() => _PokemonFavButtonState();
}

class _PokemonFavButtonState extends State<PokemonFavButton> {
  bool isFav = false;

  void toggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleFav,
      icon: Icon(
        isFav ? Icons.star : Icons.star_border,
        size: 40,
        color: Colors.orangeAccent,
      ),
    );
  }
}

class PokemonListItem extends StatelessWidget {
  PokemonListItem({this.title, this.subtitle, this.url});

  final String title;
  final String subtitle;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: Image.network(url),
        trailing: PokemonFavButton(title: title),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
