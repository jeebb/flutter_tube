import 'package:flutter/material.dart';
import 'package:flutter_tube/features/video_management/models/video.dart';

class VideoInfoWidget extends StatefulWidget {
  final VideoInfo videoInfo;

  VideoInfoWidget({@required this.videoInfo});

  @override
  State<StatefulWidget> createState() => _VideoInfoWidgetState();
}

class _VideoInfoWidgetState extends State<VideoInfoWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          _videoThumbnail(),
          _information(),
        ],
      );

  Widget _videoThumbnail() => Container(
        width: double.infinity,
        child: Image.network(
          widget.videoInfo.thumbnailUrl,
          fit: BoxFit.fitWidth,
        ),
      );

  Widget _information() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Image.network(widget.videoInfo.userAvatarUrl),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.videoInfo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${widget.videoInfo.user} - ${widget.videoInfo.views} views',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      _howLongAgo(widget.videoInfo.uploadTime),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      );

  String _howLongAgo(DateTime uploadTime) {
    final diffInDays = uploadTime.difference(DateTime.now()).inDays.abs();
    return '$diffInDays days ago';
  }
}
