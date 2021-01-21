import 'package:flutter/material.dart';
import 'package:flutter_tube/features/video_management/models/video.dart';
import 'package:flutter_tube/features/video_management/services/video_service.dart';
import 'package:flutter_tube/features/video_management/widgets/video_info_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _fetchingVideos = true;
  List<VideoInfo> _videoInfoList;

  final _videoService = VideoService();

  @override
  void initState() {
    super.initState();

    _fetchVideoList();
  }

  void _fetchVideoList() async {
    _videoInfoList = await _videoService.fetchVideoInfoList();
    setState(() {
      _fetchingVideos = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/youtube-icon.png',
            fit: BoxFit.fitHeight,
            height: 25,
          ),
          centerTitle: false,
          actions: [
            IconButton(icon: Icon(Icons.cast), onPressed: () {}),
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.person), onPressed: () {}),
          ],
        ),
        body: _homeContent(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department),
              label: 'Trending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Subscriptions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Library',
            ),
          ],
        ),
      );

  Widget _homeContent() {
    // show a progress indicator while fetching for the videos
    if (_fetchingVideos) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView(
      children: _videoInfoList
          .map(
            (videoInfo) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: VideoInfoWidget(videoInfo: videoInfo),
            ),
          )
          .toList(),
    );
  }
}
