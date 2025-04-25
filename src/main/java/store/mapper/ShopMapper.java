package store.mapper;

import store.bean.Shop;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShopMapper {
    
    /**
     * 查询所有店铺
     */
    List<Shop> findAll();
    
    /**
     * 根据ID查询店铺
     */
    Shop findById(Integer id);
    
    /**
     * 根据名称查询店铺
     */
    Shop findByName(String name);
    
    /**
     * 根据类别查询店铺
     */
    List<Shop> findByCategory(Integer categoryId);
    
    /**
     * 添加店铺
     */
    Integer insert(Shop shop);
    
    /**
     * 更新店铺
     */
    Integer update(Shop shop);
    
    /**
     * 删除店铺
     */
    Integer delete(Integer id);
    
    /**
     * 分页查询
     */
    List<Shop> findByPage(@Param("start") Integer start, @Param("size") Integer size);
    
    /**
     * 查询总记录数
     */
    Integer count();
    
    /**
     * 更新店铺状态
     */
    Integer updateStatus(@Param("id") Integer id, @Param("status") Integer status);

    List<Shop> findPending();
}