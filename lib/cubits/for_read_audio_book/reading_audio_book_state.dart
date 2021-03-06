import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:key_board_app/models/audio_model.dart';

class ReadingAudioBookState {
  bool isLoading;
  List<AudioModel> listOfAudio;
  Duration? currentPosition;
  Duration? duration;
  bool? isPlaying;
  AudioPlayer? audioPlayer;
  int index;

  ReadingAudioBookState(
      {required this.isLoading,
      required this.index,
      required this.currentPosition,
      required this.duration,
      required this.audioPlayer,
      required this.listOfAudio,
      required this.isPlaying});
}
