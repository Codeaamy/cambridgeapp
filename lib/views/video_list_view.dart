import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cambridgeapp/components/constant.dart';
import 'package:cambridgeapp/views/video_watch_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VideoListView extends StatefulWidget {
  static String videoListViewRoute = 'video_list_view';
  String standard;
  VideoListView(this.standard);

  @override
  _VideoListViewState createState() => _VideoListViewState(this.standard);
}

class _VideoListViewState extends State<VideoListView> {
  String standard;
  _VideoListViewState(this.standard);

  String appBarTitle = 'Video List';
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> videoList;
  StreamSubscription<QuerySnapshot> streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("........Video List View $standard");
    streamSubscription = _firestore.collection('videos').where('class', isEqualTo: standard).orderBy('lectureNumber', descending: false).snapshots().listen((dataSnapshot) {
      if(dataSnapshot != null){
        setState(() {
          videoList = dataSnapshot.documents;


        });
      }else{

      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle)
      ),
      body: videoList != null ? _VideoListWidgest(context) : CircularProgressIndicator(),
    );
  }

  Widget _VideoListWidgest(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              width: width * 0.4,
                              height: height / 7,

                              imageUrl: videoList[index].data['imageUrl'].toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CircularProgressIndicator(),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 8),
                                child: Text(videoList[index].data['title'].toString(), style: kTeacherHeadingStyle),
                              ),
//                              Padding(
//                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
//                                child: Container(
//                                  child: AutoSizeText(
//                                    videoList[index].data['description'].toString(), style: kTeachersBranchStyle,
//                                  ),
//                                ),
//                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                                child: Text(
                                  "Lecture Number : " + videoList[index].data['lectureNumber'].toString(),style: kTeacherHeadingStyle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                                child: Text(
                                  "Class : " + videoList[index].data['class'].toString(),style: kTeacherHeadingStyle,
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    elevation: 3,
                  ),
                  onTap: (){
                    setState(() {
                      String videoUrl = videoList[index].data['videoUrl'].toString();
                      String videoTite = videoList[index].data['title'].toString();
                      String videoDescription = videoList[index].data['description'].toString();
                      String lectureNumber = videoList[index].data['lectureNumber'].toString();
                      String standard = videoList[index].data['class'].toString();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoWatchView(videoUrl, videoTite, videoDescription, standard, lectureNumber)));
                    });

                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
