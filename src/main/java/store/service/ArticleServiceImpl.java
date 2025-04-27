package store.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Article;
import store.mapper.ArticleMapper;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Article> getAllArticles() {
        return articleMapper.getAllArticles();
    }

    @Override
    public List<Article> findArticlesByCondition(Map<String, Object> params) {
        return articleMapper.findArticlesByCondition(params);
    }

    @Override
    public void addArticle(Article article) {
        Date now = new Date();
        article.setCreateTime(now);
        article.setUpdateTime(now);
        articleMapper.addArticle(article);
    }

    @Override
    public void updateArticle(Article article) {
        article.setUpdateTime(new Date());
        articleMapper.updateArticle(article);
    }

    @Override
    public void deleteArticle(Integer id) {
        articleMapper.deleteArticle(id);
    }

    @Override
    public void batchDeleteArticles(List<Integer> ids) {
        articleMapper.batchDeleteArticles(ids);
    }

    @Override
    public Article findById(Integer id) {
        return articleMapper.findById(id);
    }

    @Override
    public boolean checkTitleExists(String title) {
        return articleMapper.checkTitleExists(title) > 0;
    }

    @Override
    public boolean checkSortOrderExists(Integer sortOrder) {
        return articleMapper.checkSortOrderExists(sortOrder) > 0;
    }

    @Override
    public List<Map<String, Object>> getAllCategories() {
        return articleMapper.getAllCategories();
    }

    @Override
    public int getArticleCount(Map<String, Object> params) {
        return articleMapper.getArticleCount(params);
    }
}