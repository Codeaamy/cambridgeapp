
import 'package:cambridgeapp/components/constant.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';
import 'package:video_player/video_player.dart';

class VideoWatchView extends StatefulWidget {
  static String videoWatchViewRoute = 'video_watch_view';
  String videoUrl ;
  String videoTitle;
  String videoDescription;
  String lectureNumber;
  String standard;
  VideoWatchView(this.videoUrl, this.videoTitle, this.videoDescription, this.standard, this.lectureNumber);
  @override
  _VideoWatchViewState createState() => _VideoWatchViewState(this.videoUrl, this.videoTitle, this.videoDescription, this.standard, this.lectureNumber);
}

class _VideoWatchViewState extends State<VideoWatchView> {
  String videoUrl;
  String videoTitle;
  String videoDescription;
  String lectureNumber;
  String standard;
  _VideoWatchViewState(this.videoUrl, this.videoTitle, this.videoDescription, this.standard, this.lectureNumber);
  String appBarTitle = 'Video Watch';
  VideoPlayerController _controller;
  bool looping = false;
  ChewieController  chewieController;
  double aspectRatio = 16 / 9;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _controller = VideoPlayerController.network(videoUrl);
  chewieController = ChewieController(
    allowedScreenSleep: false,
    allowFullScreen: true,
    deviceOrientationsAfterFullScreen: [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
    videoPlayerController: _controller,
    aspectRatio: aspectRatio,
    autoInitialize: true,
    autoPlay: true,
    showControls: true,
  );
  
  chewieController.addListener(() {
    if (chewieController.isFullScreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }else{
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }
  });

  Screen.keepOn(true);
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text(
                      lectureNumber,
                      style: kTeacherHeadingStyle,
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        videoTitle,
                        style: kTeacherHeadingStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text(
                      standard,
                      style: kTeacherHeadingStyle,
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                height: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Chewie(
                    controller: chewieController,
                  ),
                ),
              ),
              Container(
                width: width,
                height: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(videoDescription,
                  style: kTeacherHeadingStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Screen.keepOn(false);
    super.dispose();

  }
}
