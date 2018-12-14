/// UrlPaths
class UrlPath {
  /// 首页
  static const String HOME_BANNER = "/banner/json";     /// 首页 Banner
  static const String HOME_ARTICLES = "/article/list/0/json";     // 首页文章列表
  static const String USEFUL_SITES = "/friend/json";                          // 常用网站
  static const String HOT_KEY = "/hotkey/json";                               // 搜索热词

  /// 知识体系
  static const String KNOWLEDGE_TREE = "/tree/json";                                                      // 知识体系数据
  static const String KNOWLEDGE_TREE_ARTICLES = "/article/list/0/json?cid=60";        // 知识体系下的文章

  /// 导航
  static const String NAVIGATION = "/navi/json";                              // 导航数据

  /// 项目
  static const String PROJECT_CATEGORY = "/project/tree/json";                                    // 项目分类
  static const String PROJECT_DETAILS = "/project/list/1/json?cid=294";                     // 项目列表数组

  /// 登录/注册
  static const String LOGIN = "/user/login";                                        // 登录
  static const String REGISTER = "/user/register";                                // 注册
  static const String LOGOUT = "/user/logout/json";                             // 退出登录

  /// 收藏
  static const String COLLECTION_ARTICLES = "/lg/collect/list/0/json";                   // 收藏文章列表
  static const String COLLECTION_ARTICLES_INNER = "/lg/collect/1165/json";           // 收藏站内文章列表
  static const String COLLECTION_ARTICLES_OUTER = "/lg/collect/add/json";              // 收藏站外文章列表
  static const String UNCOLLECT_ARTICLES_ORIGINID = "/lg/uncollect_originId/2333/json";                // 取消收藏（文章列表）
  static const String UNCOLLECT_ARTICLES = "/lg/uncollect/2805/json";                                              // 取消收藏（我的收藏页面）
  static const String COLLECTION_USERTOOLS = "/lg/collect/usertools/json";                                        // 收藏网站列表
  static const String COLLECTION_ADDTOOL = "/lg/collect/addtool/json";                                              // 收藏网址
  static const String COLLECTION_UPDATETOOL = "/lg/collect/updatetool/json";                                    // 编辑收藏网站
  static const String COLLECTION_DELETETOOL = "/lg/collect/deletetool/json";                                      // 删除收藏网站

  /// 搜索
  static const String SEARCH = "/article/query/0/json";                             // 搜索

  /// 微信公众号
  static const String WECHAT_SUBSCRIPTIONS = "/wxarticle/chapters/json";                          // 获取公众号列表
  static const String WECHAT_ARTICLES = "/wxarticle/list/405/1/json";                                 // 查看某个公众号历史数据
  static const String WECHAT_SEARCH = "/wxarticle/list/405/1/json?k=Java";                        // 在某个公众号中搜索历史文章
}