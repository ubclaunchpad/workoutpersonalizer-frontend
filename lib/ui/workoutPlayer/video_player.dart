import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Key newKey;
  Function handleVideoCompleted;

  VideoPlayer(this.videoUrl, this.newKey, this.handleVideoCompleted): super(key: newKey);

  @override
  VideoPlayerState createState() => VideoPlayerState();
}

class VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewie;

  @override
  void initState() {
    _initControllers(widget.videoUrl);
    super.initState();
  }

  void _initControllers(String url) {
    _controller = VideoPlayerController.network(url);
    _chewie = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      autoInitialize: false,
      aspectRatio: 16 / 9,
    );
    void checkIsFinished() {
        if(_controller.value.isInitialized && _controller.value.position == _controller.value.duration) {
          widget.handleVideoCompleted();
          _controller.removeListener(checkIsFinished); // prevents duplicate calls
        }
      }
    _controller.addListener(checkIsFinished);
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewie.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Fix audio keep playing when video paused (WP-86)
    return Chewie(controller: _chewie);
  }
}