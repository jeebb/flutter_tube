class VideoInfo {
  final String videoUrl;
  final String thumbnailUrl;
  final String user;
  final String userAvatarUrl;
  final String title;
  final int views;
  final DateTime uploadTime;

  VideoInfo({
    this.videoUrl,
    this.thumbnailUrl,
    this.user,
    this.userAvatarUrl,
    this.title,
    this.views,
    this.uploadTime,
  });
}
