package store.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Product;
import store.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> getAllProducts() {
        return productMapper.getAllProducts();
    }

    @Override
    public List<Product> findProductsByCondition(Map<String, Object> params) {
        return productMapper.findProductsByCondition(params);
    }

    @Override
    public void addProduct(Product product) {
        Date now = new Date();
        product.setCreateTime(now);
        product.setUpdateTime(now);
        productMapper.addProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        product.setUpdateTime(new Date());
        productMapper.updateProduct(product);
    }

    @Override
    public void deleteProduct(Integer id) {
        productMapper.deleteProduct(id);
    }

    @Override
    public void batchDeleteProducts(List<Integer> ids) {
        productMapper.batchDeleteProducts(ids);
    }

    @Override
    public Product findById(Integer id) {
        return productMapper.findById(id);
    }

    @Override
    public boolean checkProductNameExists(String name) {
        return productMapper.checkProductNameExists(name) > 0;
    }

    @Override
    public boolean checkSortOrderExists(Integer sortOrder) {
        return productMapper.checkSortOrderExists(sortOrder) > 0;
    }

    @Override
    public List<Map<String, Object>> getAllCategories() {
        return productMapper.getAllCategories();
    }

    @Override
    public int getProductCount(Map<String, Object> params) {
        return productMapper.getProductCount(params);
    }
}