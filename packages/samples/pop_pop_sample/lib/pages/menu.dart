// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pop_pop_sample/core/utils/app_config.dart';
import 'package:pop_pop_sample/pages/game.dart';
import 'package:pop_pop_sample/widgets/header.dart';

class Menu extends StatelessWidget {
  static const routeName = 'menu';
  static const routePath = '/';

  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: AppHeader(),
              ),
              Expanded(child: Center(child: _ButtonColumn())),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  GetIt.I<AppConfig>().appVersion,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
      );
}

class _ButtonColumn extends StatelessWidget {
  const _ButtonColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: () => GoRouter.of(context).goNamed(Game.routeName),
              child: const Text('Play'),
            ),
            if (GetIt.I<AppConfig>().isHighScoreEnabled)
              OutlinedButton(
                  onPressed: () {}, child: const Text('High Scores')),
          ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: e,
                ),
              )
              .toList(),
        ),
      );
}
