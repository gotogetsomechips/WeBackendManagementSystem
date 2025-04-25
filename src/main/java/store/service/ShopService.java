package store.service;

import store.bean.ResponseResult;
import store.bean.Shop;
import java.util.List;

public interface ShopService {
    
    /**
     * 获取所有店铺
     */
    List<Shop> getAllShops();
    
    /**
     * 获取店铺详情
     */
    Shop getShopById(Integer id);
    
    /**
     * 添加店铺
     */
    ResponseResult addShop(Shop shop);

    /**
     * 更新店铺
     */
    ResponseResult updateShop(Shop shop);
    
    /**
     * 删除店铺
     */
    ResponseResult deleteShop(Integer id);
    
    /**
     * 审核店铺
     */
    ResponseResult auditShop(Integer id, Integer status);
    
    /**
     * 分页查询店铺
     */
    ResponseResult getShopsByPage(Integer pageNum, Integer pageSize);
    
    /**
     * 检查店铺名称是否存在
     */
    boolean checkShopName(String name);

    /**
     * 获取待审核的店铺
     */
    List<Shop> getPendingShops();
}