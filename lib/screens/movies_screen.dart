import 'package:flutter/material.dart';
import 'package:mvvmexampletext/movies_list.dart';
import 'package:mvvmexampletext/viewModel/movies_list_view_model.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}
class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("iron man");
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text("Pesquisar Filmes")
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      vm.fetchMovies(value);
                      _controller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Buscar",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none
                  ),
                ),
              ),
              Expanded(
                  child: MovieList(movies: vm.movies))//we will create this further down
            ])
        )
    );
  }
}