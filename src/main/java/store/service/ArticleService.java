package store.service;

import java.util.List;
import java.util.Map;
import store.bean.Article;

public interface ArticleService {

    /**
     * 获取所有文章
     */
    List<Article> getAllArticles();

    /**
     * 根据条件查询文章
     */
    List<Article> findArticlesByCondition(Map<String, Object> params);

    /**
     * 添加文章
     */
    void addArticle(Article article);

    /**
     * 更新文章
     */
    void updateArticle(Article article);

    /**
     * 删除文章
     */
    void deleteArticle(Integer id);

    /**
     * 批量删除文章
     */
    void batchDeleteArticles(List<Integer> ids);

    /**
     * 根据ID查询文章
     */
    Article findById(Integer id);

    /**
     * 检查文章标题是否存在
     */
    boolean checkTitleExists(String title);

    /**
     * 检查排序编号是否存在
     */
    boolean checkSortOrderExists(Integer sortOrder);

    /**
     * 获取所有文章分类
     */
    List<Map<String, Object>> getAllCategories();

    /**
     * 获取文章总数
     */
    int getArticleCount(Map<String, Object> params);
}