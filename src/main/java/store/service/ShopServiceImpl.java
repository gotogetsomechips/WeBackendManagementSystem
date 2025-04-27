package store.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Shop;
import store.mapper.ShopMapper;

@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopMapper shopMapper;

    @Override
    public List<Shop> getAllShops() {
        return shopMapper.getAllShops();
    }

    @Override
    public List<Shop> findShopsByCondition(Map<String, Object> params) {
        return shopMapper.findShopsByCondition(params);
    }

    @Override
    public void addShop(Shop shop) {
        Date now = new Date();
        shop.setCreateTime(now);
        shop.setUpdateTime(now);

        // 检查编号是否已存在（已在Controller层校验，此处可省略）
        shopMapper.addShop(shop);
    }

    @Override
    public void updateShop(Shop shop) {
        shop.setUpdateTime(new Date());
        shopMapper.updateShop(shop);
    }

    @Override
    public void deleteShop(Integer id) {
        shopMapper.deleteShop(id);
    }

    @Override
    public void batchDeleteShops(List<Integer> ids) {
        shopMapper.batchDeleteShops(ids);
    }

    @Override
    public Shop findById(Integer id) {
        return shopMapper.findById(id);
    }

    @Override
    public boolean checkShopNameExists(String name) {
        return shopMapper.checkShopNameExists(name) > 0;
    }

    @Override
    public boolean checkSortOrderExists(Integer sortOrder) {
        return shopMapper.checkSortOrderExists(sortOrder) > 0;
    }

    @Override
    public List<Map<String, Object>> getAllCategories() {
        return shopMapper.getAllCategories();
    }

    @Override
    public int getShopCount(Map<String, Object> params) {
        return shopMapper.getShopCount(params);
    }
}