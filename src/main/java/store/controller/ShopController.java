package store.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import store.bean.Shop;
import store.service.ShopService;

@Controller
public class ShopController {

    @Autowired
    private ShopService shopService;

    /**
     * 商铺列表页面
     */
    @RequestMapping("/Shop_list")
    public String shopList(Model model) {
        // 获取所有分类
        List<Map<String, Object>> categories = shopService.getAllCategories();
        model.addAttribute("categories", categories);
        return "Shop_list";
    }

    /**
     * 获取商铺列表数据
     */
    @RequestMapping("/getShopList")
    @ResponseBody
    public Map<String, Object> getShopList(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "categoryId", required = false) Integer categoryId,
            @RequestParam(value = "shopType", required = false) String shopType,
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
        params.put("shopType", shopType);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("start", (page - 1) * limit);
        params.put("limit", limit);
        params.put("sortField", sortField);
        params.put("sortOrder", sortOrder == null ? "asc" : sortOrder);

        List<Shop> shopList = shopService.findShopsByCondition(params);
        int total = shopService.getShopCount(params);

        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", total);
        result.put("data", shopList);

        return result;
    }

    /**
     * 添加商铺
     */
    /**
     * 添加商铺
     */
    @RequestMapping(value = "/addShop", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addShop(Shop shop) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 检查必填字段
            if (shop.getName() == null || shop.getName().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "店铺名称不能为空");
                return result;
            }
            if (shop.getCategoryId() == null) {
                result.put("success", false);
                result.put("message", "请选择所属分类");
                return result;
            }
            if (shop.getShopType() == null || shop.getShopType().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "请选择店铺类型");
                return result;
            }
            if (shop.getSortOrder() == null) {
                result.put("success", false);
                result.put("message", "编号不能为空");
                return result;
            }

            // 检查编号是否已存在
            if (shopService.checkSortOrderExists(shop.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            // 设置默认状态为待审核
            shop.setStatus(0);
            shopService.addShop(shop);

            result.put("success", true);
            result.put("message", "添加成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "添加失败：" + e.getMessage());
        }

        return result;
    }
    /**
     * 检查商铺编号是否存在
     */
    @RequestMapping("/checkSortOrderExists")
    @ResponseBody
    public Map<String, Object> checkSortOrderExists(Integer sortOrder) {
        Map<String, Object> result = new HashMap<>();
        result.put("exists", shopService.checkSortOrderExists(sortOrder));
        return result;
    }
    /**
     * 更新商铺
     */
    /**
     * 更新商铺
     */
    @RequestMapping(value = "/updateShop", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateShop(Shop shop) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 获取原商铺信息
            Shop oldShop = shopService.findById(shop.getId());
            if (oldShop == null) {
                result.put("success", false);
                result.put("message", "商铺不存在");
                return result;
            }

            // 检查店铺名称是否已存在（排除自己）
            if (!oldShop.getName().equals(shop.getName()) && shopService.checkShopNameExists(shop.getName())) {
                result.put("success", false);
                result.put("message", "店铺名称已存在");
                return result;
            }

            // 检查编号是否已存在（排除自己）
            if (!oldShop.getSortOrder().equals(shop.getSortOrder()) && shopService.checkSortOrderExists(shop.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            shopService.updateShop(shop);

            result.put("success", true);
            result.put("message", "更新成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "更新失败：" + e.getMessage());
        }

        return result;
    }
    /**
     * 删除商铺
     */
    @RequestMapping(value = "/deleteShop", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteShop(Integer id) {
        Map<String, Object> result = new HashMap<>();

        try {
            shopService.deleteShop(id);
            result.put("success", true);
            result.put("message", "删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 批量删除商铺
     */
    @RequestMapping(value = "/batchDeleteShops", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> batchDeleteShops(@RequestParam("ids[]") List<Integer> ids) {
        Map<String, Object> result = new HashMap<>();

        try {
            shopService.batchDeleteShops(ids);
            result.put("success", true);
            result.put("message", "批量删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "批量删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 根据ID获取商铺信息
     */
    @RequestMapping("/getShopById")
    @ResponseBody
    public Map<String, Object> getShopById(Integer id) {
        Map<String, Object> result = new HashMap<>();

        Shop shop = shopService.findById(id);
        if (shop != null) {
            result.put("success", true);
            result.put("data", shop);
        } else {
            result.put("success", false);
            result.put("message", "商铺不存在");
        }

        return result;
    }

    /**
     * 检查商铺名称是否存在
     */
    @RequestMapping("/checkShopName")
    @ResponseBody
    public Map<String, Object> checkShopName(String name) {
        Map<String, Object> result = new HashMap<>();
        result.put("exists", shopService.checkShopNameExists(name));
        return result;
    }

    /**
     * 获取所有商铺分类
     */
    @RequestMapping("/getAllCategories")
    @ResponseBody
    public List<Map<String, Object>> getAllCategories() {
        return shopService.getAllCategories();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}