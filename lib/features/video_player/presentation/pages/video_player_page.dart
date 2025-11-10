import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../entities/videos/videos_entity.dart';
import '../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/svg_icon.dart';

class VideoPlayerPage extends StatefulWidget {
  final VideosEntity? videosEntity;

  const VideoPlayerPage({super.key, this.videosEntity});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _videoPlayerController;

  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    if (widget.videosEntity?.videoUrl != null) {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videosEntity!.videoUrl!),
        //'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
        //closedCaptionFile: _loadCaptions(),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        //viewType: widget.viewType,
      );

      _videoPlayerController.addListener(() {
        setState(() {});
      });
      _videoPlayerController.setLooping(false);
      _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: false,
        allowPlaybackSpeedChanging: false,
        fullScreenByDefault: true,
        showOptions: false,
      );
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            return Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const SvgIcon(
            asset: AssetsIcons.arrowLeft,
            color: AppTheme.iconColor,
            size: AppDimensions.iconSizeMedium,
          ),
        ),
        title: Text('Basic Video Player'),
      ),
      body: Container(
        color: AppTheme.iconColor,
        child: Center(
          child:
              _chewieController != null &&
                  _chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: _chewieController!)
              : CircularProgressIndicator(
                  strokeWidth: AppDimensions.myAppBarToolbarItemUnderlineWidth,
                  strokeCap: StrokeCap.round,
                  color: AppTheme.greyColor3,
                ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: <Widget>[
  //         Container(padding: const EdgeInsets.only(top: 20.0)),
  //         const Text('With remote mp4'),
  //         Container(
  //           padding: const EdgeInsets.all(20),
  //           child: AspectRatio(
  //             aspectRatio: _controller.value.aspectRatio,
  //             child: Stack(
  //               alignment: Alignment.bottomCenter,
  //               children: <Widget>[
  //                 VideoPlayer(_controller),
  //                 ClosedCaption(text: _controller.value.caption.text),
  //                 _ControlsOverlay(controller: _controller),
  //                 VideoProgressIndicator(_controller, allowScrubbing: true),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  ),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(value: speed, child: Text('${speed}x')),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
