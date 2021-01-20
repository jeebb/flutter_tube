import 'package:flutter_tube/features/video_management/models/video.dart';

class VideoService {
  Future<List<VideoInfo>> fetchVideoInfoList() async {
    // use sample videos from https://gist.github.com/jsturgis/3b19447b304616f18657 and random images from unsplash
    return <VideoInfo>[
      VideoInfo(
        videoUrl:
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        thumbnailUrl: 'https://source.unsplash.com/random/300x200',
        title: 'Big Buck Bunny',
        views: 12,
        uploadTime: DateTime.now()..subtract(Duration(days: 12)),
        user: 'Bruce Wayme',
        userAvatarUrl: 'https://ui-avatars.com/api/?background=random',
      ),
      VideoInfo(
        videoUrl:
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        thumbnailUrl: 'https://source.unsplash.com/random/300x200',
        title: 'Elephant Dream',
        views: 20,
        uploadTime: DateTime.now()..subtract(Duration(days: 2)),
        user: 'Matt Murdock',
        userAvatarUrl: 'https://ui-avatars.com/api/?background=random',
      ),
      VideoInfo(
        videoUrl:
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        thumbnailUrl: 'https://source.unsplash.com/random/300x200',
        title: 'For Bigger Blazes',
        views: 20,
        uploadTime: DateTime.now()..subtract(Duration(days: 4)),
        user: 'Jon Snow',
        userAvatarUrl: 'https://ui-avatars.com/api/?background=random',
      ),
    ];
  }
}
