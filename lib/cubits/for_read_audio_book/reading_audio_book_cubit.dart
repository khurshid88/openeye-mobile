import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_board_app/cubits/for_read_audio_book/reading_audio_book_state.dart';
import 'package:key_board_app/models/audio_model.dart';
import 'package:key_board_app/services/file_picker_service.dart';

class ReadingAudioBookCubit extends Cubit<ReadingAudioBookState> {
  ReadingAudioBookCubit()
      : super(ReadingAudioBookState(
            isLoading: true,
            isConverting: true,
            error: false,
            audioPlayer: AudioPlayer(),
            currentPosition: Duration.zero,
            duration: Duration.zero,
            index: 0,
            isPlaying: false,
            listOfAudio: []));

 late StreamSubscription litening;


  /// #get pdf from device file
  Future<void> readDocumentDataAndListeningOnStream() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ["pdf"]);
    emit(ReadingAudioBookState(
        error: state.error,
        isConverting: false,
        isLoading: state.isLoading,
        audioPlayer: state.audioPlayer,
        currentPosition: state.currentPosition,
        duration: state.duration,
        index: state.index,
        isPlaying: state.isPlaying,
        listOfAudio: state.listOfAudio));
    if (result != null && result.paths.toString().contains("pdf")) {
      File file = File(result.files.first.path!);

      Stream<AudioModel?> stream =  FileServises.getPdfTextAndPushReadingBookPage(false, [file.path, result.files.first.name]);



      litening =  stream.listen((audioModel){
        _listeningAudioModel(audioModel);
      });



    } else {

    }
  }





  removeLitening(){
    litening.cancel();
  }


  _listeningAudioModel(AudioModel? audioModel){

    if(audioModel!=null){
      state.listOfAudio.add(audioModel);
      print(state.listOfAudio);
      if(audioModel.index!=null&&audioModel.index==0){
        startAndLoadAudioFiles(0,state.listOfAudio);
      }
    }


    emit(ReadingAudioBookState(
        error: state.error,
        isConverting: state.isConverting,
        isLoading: state.isLoading,
        audioPlayer: state.audioPlayer,
        currentPosition: state.currentPosition,
        duration: state.duration,
        index: state.index,
        isPlaying: state.isPlaying,
        listOfAudio: state.listOfAudio));
  }


  startAndLoadAudioFiles(int curentIndex, List<AudioModel> listOfAudio) {
    state.audioPlayer!.onPlayerCompletion.listen((event) {
      curentIndex++;

      if (curentIndex > state.listOfAudio.length - 1) {
        curentIndex = 0;
      }

      emit(ReadingAudioBookState(
          isLoading: state.isLoading,
          audioPlayer: state.audioPlayer,
          error: state.error,
          isConverting: state.isConverting,
          currentPosition: state.currentPosition,
          duration: state.duration,
          index: curentIndex,
          isPlaying: state.isPlaying,
          listOfAudio: listOfAudio));

      play(listOfAudio[curentIndex]);
    });

    state.audioPlayer!.onPlayerStateChanged.listen((event) {
      state.isPlaying = event == PlayerState.PLAYING;

      emit(ReadingAudioBookState(
          isLoading: state.isLoading,
          audioPlayer: state.audioPlayer,
          error: state.error,
          isConverting: state.isConverting,
          currentPosition: state.currentPosition,
          duration: state.duration,
          index: state.index,
          isPlaying: event == PlayerState.PLAYING,
          listOfAudio: listOfAudio));
    });

    state.audioPlayer!.onDurationChanged.listen((event) {
      emit(ReadingAudioBookState(
          isLoading: state.isLoading,
          audioPlayer: state.audioPlayer,
          error: state.error,
          isConverting: state.isConverting,
          currentPosition: state.currentPosition,
          duration: event,
          index: state.index,
          isPlaying: state.isPlaying,
          listOfAudio: listOfAudio));
    });

    state.audioPlayer!.onAudioPositionChanged.listen((event) {
      state.currentPosition = event;
      emit(ReadingAudioBookState(
          isLoading: state.isLoading,
          audioPlayer: state.audioPlayer,
          error: state.error,
          isConverting: state.isConverting,
          currentPosition: event,
          duration: state.duration,
          index: state.index,
          isPlaying: state.isPlaying,
          listOfAudio: listOfAudio));
    });

    play(listOfAudio[curentIndex]);
  }

  play(AudioModel audioModel) async {
    File audioFile = File(audioModel.path);
    int result = await state.audioPlayer!.play(audioFile.path, isLocal: true);
    if (result == 1) {
      //play success
      emit(ReadingAudioBookState(
          isLoading: false,
          audioPlayer: state.audioPlayer,
          currentPosition: state.currentPosition,
          duration: state.duration,
          index: state.index,
          error: state.error,
          isConverting: state.isConverting,
          isPlaying: state.isPlaying,
          listOfAudio: state.listOfAudio));
    } else {
      print("Error while playing sound.");
    }
  }

  backAudioButton() {
    state.audioPlayer!.stop();

    state.index--;
    if (state.index < 0) {
      state.index = state.listOfAudio.length - 1;
    }

    play(state.listOfAudio[state.index]);
    emit(ReadingAudioBookState(
        error: state.error,
        isConverting: state.isConverting,
        isLoading: state.isLoading,
        audioPlayer: state.audioPlayer,
        currentPosition: state.currentPosition,
        duration: state.duration,
        index: state.index,
        isPlaying: state.isPlaying,
        listOfAudio: state.listOfAudio));
  }

  nextAudioButton() {
    state.audioPlayer!.stop();
    state.index++;
    if (state.index > state.listOfAudio.length - 1) {
      state.index = 0;
    }

    print(state.listOfAudio.toString()+"0000000000000000000000000000");

    play(state.listOfAudio[state.index]);
    emit(ReadingAudioBookState(
        isLoading: state.isLoading,
        error: state.error,
        isConverting: state.isConverting,
        audioPlayer: state.audioPlayer,
        currentPosition: state.currentPosition,
        duration: state.duration,
        index: state.index,
        isPlaying: state.isPlaying,
        listOfAudio: state.listOfAudio));
  }

  stopOrPlayButton() {
    if (state.isPlaying!) {
      state.audioPlayer!.pause();
    } else {
      state.audioPlayer!.resume();
    }
  }

  stop() {
    print(state.isPlaying);
    state.audioPlayer!.stop();
  }

  resume() {
    state.audioPlayer!.resume();
  }





}
