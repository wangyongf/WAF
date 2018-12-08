class WanAndroidArticleListModel {
  final String avatarUrl;
  final String chapterName;
  final String superChapterName;
  final String title;
  final String author;
  final String publishTime;

  WanAndroidArticleListModel(this.avatarUrl, this.chapterName,
      this.superChapterName, this.title, this.author, this.publishTime);

  WanAndroidArticleListModel.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['avatarUrl'],
        chapterName = json['chapterName'],
        superChapterName = json['superChapterName'],
        title = json['title'],
        author = json['author'],
        publishTime = json['publishTime'];
}
