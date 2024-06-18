import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentis/feature/games/views/random_game/random_game_data.dart';
import 'package:mentis/feature/games/views/random_game/random_game_widgets.dart';

class RandomGameScreen extends StatefulWidget {
  const RandomGameScreen({super.key});

  @override
  State<RandomGameScreen> createState() => _RandomGameScreenState();
}

class _RandomGameScreenState extends State<RandomGameScreen> {
  static final _rng = Random();
  late Alignment _playerAlignment;
  late List<Alignment> _targets;
  late RandomGameTargetData _targetData;
  int _score = 0;
  bool _gameInProgress = false;
  final GameTimer _gameTimer = GameTimer();

  @override
  void initState() {
    super.initState();
    _playerAlignment = const Alignment(0, 0);
    _gameTimer.remainingSeconds.addListener(() {
      if (_gameTimer.remainingSeconds.value == 0) {
        setState(() {
          _gameInProgress = false;
        });
      }
    });
    _randomize();
  }

  void _randomize() {
    _targetData = RandomGameTargetData(
      type: TargetType.values[_rng.nextInt(2)],
      index: _rng.nextInt(targetColors.length),
    );
    _targets = [
      for (var i = 0; i < targetColors.length; i++)
        Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        )
    ];
  }

  void _startGame() {
    _randomize();
    setState(() {
      _score = 0;
      _gameInProgress = true;
    });
    _gameTimer.startGame();
  }

  /// This method contains most of the game logic
  void _handleTapDown(TapDownDetails details, int? selectedIndex) {
    if (!_gameInProgress) {
      return;
    }
    final size = MediaQuery.of(context).size;
    setState(() {
      if (selectedIndex != null) {
        _playerAlignment = _targets[selectedIndex];
        final didScore = selectedIndex == _targetData.index;
        Future.delayed(const Duration(milliseconds: 250), () {
          setState(() {
            if (didScore) {
              _score++;
            } else {
              _score--;
            }
            _randomize();
          });
        });
        // score point
      } else {
        _playerAlignment = Alignment(
          2 * (details.localPosition.dx / size.width) - 1,
          2 * (details.localPosition.dy / size.height) - 1,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTapDown: (details) => _handleTapDown(details, null),
            ),
          ),
          Align(
            alignment: _playerAlignment,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: _targetData.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          for (var i = 0; i < targetColors.length; i++)
            GestureDetector(
              onTapDown: (details) => _handleTapDown(details, i),
              child: Align(
                alignment: _targets[i],
                child: RandomGameTargetWidget(
                  color: targetColors[i],
                  textColor: textColors[i],
                  text: i.toString(),
                ),
              ),
            ),
          Align(
            alignment: const Alignment(0, 0),
            child: IgnorePointer(
              ignoring: _gameInProgress,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextPrompt(
                    'Score: $_score',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  TextPrompt(
                    _gameInProgress ? 'Tap ${_targetData.text}' : 'Game Over!',
                    color: _gameInProgress ? _targetData.color : Colors.white,
                  ),
                  _gameInProgress
                      ? ValueListenableBuilder(
                          valueListenable: _gameTimer.remainingSeconds,
                          builder: (context, remainingSeconds, _) {
                            return TextPrompt(remainingSeconds.toString(), color: Colors.white);
                          },
                        )
                      : OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: const BorderSide(width: 2, color: Colors.white),
                          ),
                          onPressed: _startGame,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextPrompt('Start', color: Colors.white),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
