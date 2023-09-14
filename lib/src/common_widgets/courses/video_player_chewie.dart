
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget(
//       {required this.url, required this.dataSourceType, super.key});
//   final String url;
//   final DataSourceType dataSourceType;

//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewiwController;

//   @override
//   void initState() {
//     super.initState();
//     switch (widget.dataSourceType) {
//       case DataSourceType.asset:
//         _videoPlayerController = VideoPlayerController.asset(widget.url);
//         break;

//       case DataSourceType.network:
//         _videoPlayerController =
//             VideoPlayerController.networkUrl(Uri.parse(widget.url));
//         break;
//       case DataSourceType.file:
//       _videoPlayerController = VideoPlayerController.asset(widget.url);

//         // _videoPlayerController = VideoPlayerController.file(File(widget.url));
//         break;
//       case DataSourceType.contentUri:
//         _videoPlayerController =
//             VideoPlayerController.contentUri(Uri.parse(widget.url));
//         break;
//     }
//     _chewiwController = ChewieController(
//         videoPlayerController: _videoPlayerController, aspectRatio: 1,
//         allowFullScreen:false,
//         autoPlay:true,
//         draggableProgressBar: false,
//         autoInitialize: true,
//         showControls: false,
//         placeholder: Container(height: 100,width: 100,color:Colors.red)
        
//         );
//   }

//   @override
//   void dispose(){
//     _videoPlayerController.dispose();
//     _chewiwController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,

//               // color: Colors.red,
//       children: [
//         AspectRatio(aspectRatio: 16/9,
//           child: Chewie(controller: _chewiwController),
        
//         )

//     ],);
//   }
// }
