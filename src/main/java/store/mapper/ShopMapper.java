package store.mapper;

import java.util.List;
import java.util.Map;
import store.bean.Shop;
import org.apache.ibatis.annotations.Param;

public interface ShopMapper {

    // 获取所有商铺
    List<Shop> getAllShops();

    // 根据条件查询商铺
    List<Shop> findShopsByCondition(Map<String, Object> params);

    // 添加商铺
    void addShop(Shop shop);

    // 更新商铺
    void updateShop(Shop shop);

    // 删除商铺
    void deleteShop(Integer id);

    // 批量删除商铺
    void batchDeleteShops(@Param("ids") List<Integer> ids);

    // 根据ID查询商铺
    Shop findById(Integer id);
    // 检查编号是否存在
    int checkSortOrderExists(Integer sortOrder);
    // 检查商铺名称是否存在
    int checkShopNameExists(String name);

    // 获取所有商铺分类
    List<Map<String, Object>> getAllCategories();

    // 获取商铺总数
    int getShopCount(Map<String, Object> params);
}