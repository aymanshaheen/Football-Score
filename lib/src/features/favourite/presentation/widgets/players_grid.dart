import 'dart:math';
import 'package:Goal/src/config/app_route.dart';
import 'package:Goal/src/features/favourite/presentation/cubit/team_cubit/favourite_cubit.dart';
import 'package:Goal/src/features/team/domain/entities/favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PlayersGrid extends StatefulWidget {
  const PlayersGrid({super.key});

  @override
  _PlayersGridState createState() => _PlayersGridState();
}

class _PlayersGridState extends State<PlayersGrid>
    with TickerProviderStateMixin {
  final colors = [
    const Color(0xFF89CFF0), // Baby blue
    const Color.fromARGB(255, 229, 113, 255), // White green
    const Color.fromARGB(255, 87, 199, 109), // White purple
    const Color(0xFFFFB347), // White orange
  ];
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(colors.length, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
    });

    for (var i = 0; i < _controllers.length; i++) {
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;

    return StreamBuilder<List<Favourite>>(
      stream: FavouriteCubit.get(context).getPlayers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return FadeTransition(
                opacity: _controllers[index % _controllers.length].drive(
                  Tween(begin: 0.0, end: 1.0).chain(
                    CurveTween(
                        curve: Interval((1 / _controllers.length) * index, 1.0,
                            curve: Curves.ease)),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Routes.player,
                      arguments: snapshot.data![index].id,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: colors[Random().nextInt(colors.length)],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: Image(
                            image: NetworkImage(snapshot.data![index].photo),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(snapshot.data![index].name,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
