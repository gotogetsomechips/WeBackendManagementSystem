package store.service;

import java.util.List;
import java.util.Map;
import store.bean.Shop;

public interface ShopService {

    /**
     * 获取所有商铺
     */
    List<Shop> getAllShops();

    /**
     * 根据条件查询商铺
     */
    List<Shop> findShopsByCondition(Map<String, Object> params);

    /**
     * 添加商铺
     */
    void addShop(Shop shop);

    /**
     * 更新商铺
     */
    void updateShop(Shop shop);

    /**
     * 删除商铺
     */
    void deleteShop(Integer id);

    /**
     * 批量删除商铺
     */
    void batchDeleteShops(List<Integer> ids);

    /**
     * 根据ID查询商铺
     */
    Shop findById(Integer id);

    /**
     * 检查商铺名称是否存在
     */
    boolean checkShopNameExists(String name);

    boolean checkSortOrderExists(Integer sortOrder);
    /**
     * 获取所有商铺分类
     */
    List<Map<String, Object>> getAllCategories();

    /**
     * 获取商铺总数
     */
    int getShopCount(Map<String, Object> params);
}