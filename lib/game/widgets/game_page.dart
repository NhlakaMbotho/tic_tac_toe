import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_test/game/bloc/game_bloc.dart';

import 'widgets.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          if (state.status == Status.won || state.status == Status.draw) {
            showModalBottomSheet(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<GameBloc>(),
                child: const GameStatusSheet(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Flexible(
                  flex: 6,
                  child: ScoreHeader(state: state),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 7,
                  child: Grid(positions: state.positions),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 1,
                  child: ActionButton(status: state.status),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
