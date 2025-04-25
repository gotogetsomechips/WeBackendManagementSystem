package store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import store.bean.ResponseResult;
import store.bean.Shop;
import store.bean.User;
import store.service.ShopService;

@Controller
public class ShopController {
    
    @Autowired
    private ShopService shopService;
    
    /**
     * 跳转到店铺列表页面
     */
    @GetMapping("/shop_list")
    public String toShopList(Model model) {
        model.addAttribute("shops", shopService.getAllShops());
        return "shop_list";
    }
    
    /**
     * 跳转到店铺审核页面
     */
    @GetMapping("/shops_audit")
    public String toShopsAudit(Model model) {
        // 获取待审核的店铺
        model.addAttribute("shops", shopService.getPendingShops());
        return "shops_audit";
    }
    
    /**
     * 分页获取店铺列表
     */
    @GetMapping("/shops")
    @ResponseBody
    public ResponseResult getShopsByPage(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        return shopService.getShopsByPage(pageNum, pageSize);
    }
    
    /**
     * 跳转到添加店铺页面
     */
    @GetMapping("/shop_add")
    public String toShopAdd() {
        return "shop_add";
    }
    
    /**
     * 添加店铺
     */
    @PostMapping("/shop")
    @ResponseBody
    public ResponseResult addShop(Shop shop, HttpSession session) {
        // 获取当前登录用户
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return ResponseResult.error("请先登录");
        }
        
        return shopService.addShop(shop);
    }
    
    /**
     * 检查店铺名称是否存在
     */
    @GetMapping("/check_shop_name")
    @ResponseBody
    public ResponseResult checkShopName(@RequestParam("name") String name) {
        boolean exists = shopService.checkShopName(name);
        if(exists) {
            return ResponseResult.error("店铺名称已存在");
        } else {
            return ResponseResult.success();
        }
    }
    
    /**
     * 跳转到编辑店铺页面
     */
    @GetMapping("/shop_edit/{id}")
    public String toShopEdit(@PathVariable("id") Integer id, Model model) {
        Shop shop = shopService.getShopById(id);
        model.addAttribute("shop", shop);
        return "shop_edit";
    }
    
    /**
     * 更新店铺信息
     */
    @PostMapping("/shop_update")
    @ResponseBody
    public ResponseResult updateShop(Shop shop) {
        return shopService.updateShop(shop);
    }
    
    /**
     * 删除店铺
     */
    @PostMapping("/shop_delete")
    @ResponseBody
    public ResponseResult deleteShop(@RequestParam("id") Integer id) {
        return shopService.deleteShop(id);
    }
    
    /**
     * 审核店铺
     */
    @PostMapping("/shop_audit")
    @ResponseBody
    public ResponseResult auditShop(
            @RequestParam("id") Integer id,
            @RequestParam("status") Integer status) {
        return shopService.auditShop(id, status);
    }
    
    /**
     * 跳转到店铺详情页面
     */
    @GetMapping("/shop_detail/{id}")
    public String toShopDetail(@PathVariable("id") Integer id, Model model) {
        Shop shop = shopService.getShopById(id);
        model.addAttribute("shop", shop);
        return "shop_detail";
    }
}