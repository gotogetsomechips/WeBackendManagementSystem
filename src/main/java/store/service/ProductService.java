package store.service;

import java.util.List;
import java.util.Map;
import store.bean.Product;

public interface ProductService {
    /**
     * 获取所有产品
     */
    List<Product> getAllProducts();

    /**
     * 根据条件查询产品
     */
    List<Product> findProductsByCondition(Map<String, Object> params);

    /**
     * 添加产品
     */
    void addProduct(Product product);

    /**
     * 更新产品
     */
    void updateProduct(Product product);

    /**
     * 删除产品
     */
    void deleteProduct(Integer id);

    /**
     * 批量删除产品
     */
    void batchDeleteProducts(List<Integer> ids);

    /**
     * 根据ID查询产品
     */
    Product findById(Integer id);

    /**
     * 检查产品名称是否存在
     */
    boolean checkProductNameExists(String name);

    /**
     * 检查产品编号是否存在
     */
    boolean checkSortOrderExists(Integer sortOrder);

    /**
     * 获取所有产品分类
     */
    List<Map<String, Object>> getAllCategories();

    /**
     * 获取产品总数
     */
    int getProductCount(Map<String, Object> params);
}