package store.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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
import store.bean.Product;
import store.service.ProductService;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 产品列表页面
     */
    @RequestMapping("/Product_list")
    public String productList(Model model) {
        // 获取所有分类
        List<Map<String, Object>> categories = productService.getAllCategories();
        model.addAttribute("categories", categories);
        return "Product_list";
    }

    /**
     * 获取产品列表数据
     */
    @RequestMapping("/getProductList")
    @ResponseBody
    public Map<String, Object> getProductList(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "categoryId", required = false) Integer categoryId,
            @RequestParam(value = "region", required = false) String region,
            @RequestParam(value = "minPrice", required = false) Double minPrice,
            @RequestParam(value = "maxPrice", required = false) Double maxPrice,
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
        params.put("name", name);
        params.put("categoryId", categoryId);
        params.put("region", region);
        params.put("minPrice", minPrice);
        params.put("maxPrice", maxPrice);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("start", (page - 1) * limit);
        params.put("limit", limit);
        params.put("sortField", sortField);
        params.put("sortOrder", sortOrder == null ? "asc" : sortOrder);

        List<Product> productList = productService.findProductsByCondition(params);
        int total = productService.getProductCount(params);

        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", total);
        result.put("data", productList);

        return result;
    }

    /**
     * 添加产品
     */
    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addProduct(Product product) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 检查必填字段
            if (product.getName() == null || product.getName().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "产品名称不能为空");
                return result;
            }
            if (product.getCategoryId() == null) {
                result.put("success", false);
                result.put("message", "请选择所属分类");
                return result;
            }
            if (product.getOriginalPrice() == null || product.getOriginalPrice() <= 0) {
                result.put("success", false);
                result.put("message", "请输入有效的原价格");
                return result;
            }
            if (product.getCurrentPrice() == null || product.getCurrentPrice() <= 0) {
                result.put("success", false);
                result.put("message", "请输入有效的现价");
                return result;
            }
            if (product.getSortOrder() == null) {
                result.put("success", false);
                result.put("message", "编号不能为空");
                return result;
            }

            // 检查编号是否已存在
            if (productService.checkSortOrderExists(product.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            // 设置默认状态为待审核
            product.setStatus(0);
            productService.addProduct(product);

            result.put("success", true);
            result.put("message", "添加成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "添加失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 检查产品编号是否存在
     */
    @RequestMapping("/product/checkSortOrderExists")
    @ResponseBody
    public Map<String, Object> checkSortOrderExists(Integer sortOrder) {
        Map<String, Object> result = new HashMap<>();
        result.put("exists", productService.checkSortOrderExists(sortOrder));
        return result;
    }

    /**
     * 更新产品
     */
    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateProduct(Product product) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 获取原产品信息
            Product oldProduct = productService.findById(product.getId());
            if (oldProduct == null) {
                result.put("success", false);
                result.put("message", "产品不存在");
                return result;
            }

            // 检查产品名称是否已存在（排除自己）
            if (!oldProduct.getName().equals(product.getName()) && productService.checkProductNameExists(product.getName())) {
                result.put("success", false);
                result.put("message", "产品名称已存在");
                return result;
            }

            // 检查编号是否已存在（排除自己）
            if (!oldProduct.getSortOrder().equals(product.getSortOrder()) && productService.checkSortOrderExists(product.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            productService.updateProduct(product);

            result.put("success", true);
            result.put("message", "更新成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "更新失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 删除产品
     */
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteProduct(Integer id) {
        Map<String, Object> result = new HashMap<>();

        try {
            productService.deleteProduct(id);
            result.put("success", true);
            result.put("message", "删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 批量删除产品
     */
    @RequestMapping(value = "/batchDeleteProducts", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> batchDeleteProducts(@RequestParam("ids[]") List<Integer> ids) {
        Map<String, Object> result = new HashMap<>();

        try {
            productService.batchDeleteProducts(ids);
            result.put("success", true);
            result.put("message", "批量删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "批量删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 根据ID获取产品信息
     */
    @RequestMapping("/getProductById")
    @ResponseBody
    public Map<String, Object> getProductById(Integer id) {
        Map<String, Object> result = new HashMap<>();

        Product product = productService.findById(id);
        if (product != null) {
            result.put("success", true);
            result.put("data", product);
        } else {
            result.put("success", false);
            result.put("message", "产品不存在");
        }

        return result;
    }

    /**
     * 检查产品名称是否存在
     */
    @RequestMapping("/checkProductName")
    @ResponseBody
    public Map<String, Object> checkProductName(String name) {
        Map<String, Object> result = new HashMap<>();
        result.put("exists", productService.checkProductNameExists(name));
        return result;
    }

    /**
     * 获取所有产品分类
     */
    @RequestMapping("/product/getAllCategories")
    @ResponseBody
    public List<Map<String, Object>> getAllCategories() {
        return productService.getAllCategories();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}