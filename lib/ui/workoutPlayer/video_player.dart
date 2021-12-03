import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final UniqueKey newKey;

  VideoPlayer(this.videoUrl, this.newKey): super(key: newKey);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
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
      // autoPlay: true,
      autoInitialize: true,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewie.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewie);
  }
}