package store.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import store.bean.Article;
import store.service.ArticleService;

@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    /**
     * 检查文章标题是否存在
     */
    @RequestMapping("/article/checkTitleExists")
    @ResponseBody
    public Map<String, Object> checkTitleExists(
            @RequestParam String title,
            @RequestParam(required = false) Integer id) {
        Map<String, Object> result = new HashMap<>();
        boolean exists;

        if (id != null) {
            // 编辑时检查，排除当前记录
            Article article = articleService.findById(id);
            exists = articleService.checkTitleExists(title) &&
                    !article.getTitle().equals(title);
        } else {
            // 添加时检查
            exists = articleService.checkTitleExists(title);
        }

        result.put("exists", exists);
        return result;
    }

    /**
     * 检查文章编号是否存在
     */
    @RequestMapping("/article/checkSortOrderExists")
    @ResponseBody
    public Map<String, Object> checkSortOrderExists(
            @RequestParam Integer sortOrder,
            @RequestParam(required = false) Integer id) {
        Map<String, Object> result = new HashMap<>();
        boolean exists;

        if (id != null) {
            // 编辑时检查，排除当前记录
            Article article = articleService.findById(id);
            exists = articleService.checkSortOrderExists(sortOrder) &&
                    !article.getSortOrder().equals(sortOrder);
        } else {
            // 添加时检查
            exists = articleService.checkSortOrderExists(sortOrder);
        }

        result.put("exists", exists);
        return result;
    }

    @RequestMapping("/Article_list")
    public String articleList(Model model) {
        // 获取所有分类（直接从t_article表中获取）
        List<Map<String, Object>> categories = articleService.getAllCategories();
        model.addAttribute("categories", categories);
        System.out.println("Categories: " + categories);
        return "Article_list";
    }

    /**
     * 获取文章列表数据
     */
    @RequestMapping("/getArticleList")
    @ResponseBody
    public Map<String, Object> getArticleList(
            @RequestParam(value = "title", required = false) String title,
            @RequestParam(value = "categoryId", required = false) Integer categoryId,
            @RequestParam(value = "status", required = false) Integer status,
            @RequestParam(value = "startTime", required = false) String startTime,
            @RequestParam(value = "endTime", required = false) String endTime,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit,
            @RequestParam(value = "sortField", required = false) String sortField,
            @RequestParam(value = "sortOrder", required = false) String sortOrder) {

        if (startTime != null && startTime.trim().isEmpty()) {
            startTime = null;
        }
        if (endTime != null && endTime.trim().isEmpty()) {
            endTime = null;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("title", title);
        params.put("categoryId", categoryId);
        params.put("status", status);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("start", (page - 1) * limit);
        params.put("limit", limit);
        params.put("sortField", sortField);
        params.put("sortOrder", sortOrder == null ? "asc" : sortOrder);

        List<Article> articleList = articleService.findArticlesByCondition(params);
        int total = articleService.getArticleCount(params);

        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", total);
        result.put("data", articleList);

        return result;
    }

    /**
     * 添加文章
     */
    @RequestMapping(value = "/addArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addArticle(Article article) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 检查必填字段
            if (article.getTitle() == null || article.getTitle().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "文章标题不能为空");
                return result;
            }
            if (article.getCategoryId() == null) {
                result.put("success", false);
                result.put("message", "请选择所属分类");
                return result;
            }
            if (article.getSortOrder() == null) {
                result.put("success", false);
                result.put("message", "编号不能为空");
                return result;
            }

            // 检查编号是否已存在
            if (articleService.checkSortOrderExists(article.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            // 设置默认状态为待发布
            if (article.getStatus() == null) {
                article.setStatus(0);
            }
            articleService.addArticle(article);

            result.put("success", true);
            result.put("message", "添加成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "添加失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 检查文章编号是否存在
     */
    @RequestMapping("/checkArticleSortOrderExists")
    @ResponseBody
    public Map<String, Object> checkArticleSortOrderExists(Integer sortOrder) {
        Map<String, Object> result = new HashMap<>();
        result.put("exists", articleService.checkSortOrderExists(sortOrder));
        return result;
    }

    /**
     * 更新文章
     */
    @RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateArticle(Article article) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 获取原文章信息
            Article oldArticle = articleService.findById(article.getId());
            if (oldArticle == null) {
                result.put("success", false);
                result.put("message", "文章不存在");
                return result;
            }

            // 检查标题是否已存在（排除自己）
            if (!oldArticle.getTitle().equals(article.getTitle()) && articleService.checkTitleExists(article.getTitle())) {
                result.put("success", false);
                result.put("message", "文章标题已存在");
                return result;
            }

            // 检查编号是否已存在（排除自己）
            if (!oldArticle.getSortOrder().equals(article.getSortOrder()) && articleService.checkSortOrderExists(article.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            articleService.updateArticle(article);

            result.put("success", true);
            result.put("message", "更新成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "更新失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 删除文章
     */
    @RequestMapping(value = "/deleteArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteArticle(Integer id) {
        Map<String, Object> result = new HashMap<>();

        try {
            articleService.deleteArticle(id);
            result.put("success", true);
            result.put("message", "删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 批量删除文章
     */
    @RequestMapping(value = "/batchDeleteArticles", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> batchDeleteArticles(@RequestParam("ids[]") List<Integer> ids) {
        Map<String, Object> result = new HashMap<>();

        try {
            articleService.batchDeleteArticles(ids);
            result.put("success", true);
            result.put("message", "批量删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "批量删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 根据ID获取文章信息
     */
    @RequestMapping("/getArticleById")
    @ResponseBody
    public Map<String, Object> getArticleById(Integer id) {
        Map<String, Object> result = new HashMap<>();

        Article article = articleService.findById(id);
        if (article != null) {
            result.put("success", true);
            result.put("data", article);
        } else {
            result.put("success", false);
            result.put("message", "文章不存在");
        }

        return result;
    }

    /**
     * 检查文章标题是否存在
     */
    @RequestMapping("/checkArticleTitle")
    @ResponseBody
    public Map<String, Object> checkArticleTitle(String title) {
        Map<String, Object> result = new HashMap<>();
        result.put("exists", articleService.checkTitleExists(title));
        return result;
    }

    /**
     * 获取所有文章分类
     */
    @RequestMapping("/getArticleCategories")
    @ResponseBody
    public List<Map<String, Object>> getArticleCategories() {
        return articleService.getAllCategories();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}