package store.service;

import store.bean.ResponseResult;
import store.bean.Shop;
import store.mapper.ShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopMapper shopMapper;
    
    @Override
    public List<Shop> getAllShops() {
        return shopMapper.findAll();
    }
    
    @Override
    public Shop getShopById(Integer id) {
        return shopMapper.findById(id);
    }
    
    @Override
    public ResponseResult addShop(Shop shop) {
        // 参数校验
        if (shop.getName() == null || shop.getName().trim().isEmpty()) {
            return ResponseResult.error("店铺名称不能为空");
        }
        if (shop.getCategoryId() == null) {
            return ResponseResult.error("请选择店铺分类");
        }
        if (shop.getType() == null) {
            return ResponseResult.error("请选择店铺类型");
        }
        if (shop.getIntroduction() == null || shop.getIntroduction().trim().isEmpty()) {
            return ResponseResult.error("店铺简介不能为空");
        }
        
        // 检查店铺名称是否已存在
        if (checkShopName(shop.getName())) {
            return ResponseResult.error("店铺名称已存在");
        }
        
        // 设置店铺初始状态为待审核
        shop.setStatus(0);
        
        // 设置店铺类型名称
        if (shop.getType() == 1) {
            shop.setTypeName("个人店铺");
        } else if (shop.getType() == 2) {
            shop.setTypeName("企业店铺");
        }
        
        // 插入数据
        Integer rows = shopMapper.insert(shop);
        if (rows != 1) {
            return ResponseResult.error("添加失败，请稍后再试");
        }
        
        return ResponseResult.success();
    }
    
    @Override
    public ResponseResult updateShop(Shop shop) {
        // 参数校验
        if (shop.getId() == null) {
            return ResponseResult.error("店铺ID不能为空");
        }
        if (shop.getName() == null || shop.getName().trim().isEmpty()) {
            return ResponseResult.error("店铺名称不能为空");
        }
        
        // 检查店铺是否存在
        Shop existingShop = shopMapper.findById(shop.getId());
        if (existingShop == null) {
            return ResponseResult.error("店铺不存在");
        }
        
        // 如果修改了店铺名称，检查是否与其他店铺重名
        if (!existingShop.getName().equals(shop.getName())) {
            Shop shopWithSameName = shopMapper.findByName(shop.getName());
            if (shopWithSameName != null && !shopWithSameName.getId().equals(shop.getId())) {
                return ResponseResult.error("店铺名称已存在");
            }
        }
        
        // 设置店铺类型名称
        if (shop.getType() == 1) {
            shop.setTypeName("个人店铺");
        } else if (shop.getType() == 2) {
            shop.setTypeName("企业店铺");
        }
        
        // 更新数据
        Integer rows = shopMapper.update(shop);
        if (rows != 1) {
            return ResponseResult.error("更新失败，请稍后再试");
        }
        
        return ResponseResult.success();
    }
    
    @Override
    public ResponseResult deleteShop(Integer id) {
        // 参数校验
        if (id == null) {
            return ResponseResult.error("店铺ID不能为空");
        }
        
        // 检查店铺是否存在
        Shop shop = shopMapper.findById(id);
        if (shop == null) {
            return ResponseResult.error("店铺不存在");
        }
        
        // 删除数据
        Integer rows = shopMapper.delete(id);
        if (rows != 1) {
            return ResponseResult.error("删除失败，请稍后再试");
        }
        
        return ResponseResult.success();
    }
    
    @Override
    public ResponseResult auditShop(Integer id, Integer status) {
        // 参数校验
        if (id == null) {
            return ResponseResult.error("店铺ID不能为空");
        }
        if (status == null || (status != 1 && status != 2)) {
            return ResponseResult.error("审核状态不正确");
        }
        
        // 检查店铺是否存在
        Shop shop = shopMapper.findById(id);
        if (shop == null) {
            return ResponseResult.error("店铺不存在");
        }
        
        // 更新状态
        Integer rows = shopMapper.updateStatus(id, status);
        if (rows != 1) {
            return ResponseResult.error("审核操作失败，请稍后再试");
        }
        
        return ResponseResult.success();
    }
    
    @Override
    public ResponseResult getShopsByPage(Integer pageNum, Integer pageSize) {
        if (pageNum == null || pageNum < 1) {
            pageNum = 1;
        }
        if (pageSize == null || pageSize < 1) {
            pageSize = 10;
        }
        
        // 计算起始索引
        Integer start = (pageNum - 1) * pageSize;
        
        // 查询数据
        List<Shop> shops = shopMapper.findByPage(start, pageSize);
        Integer total = shopMapper.count();
        
        // 计算总页数
        Integer totalPages = (total + pageSize - 1) / pageSize;
        
        // 封装结果
        Map<String, Object> data = new HashMap<>();
        data.put("list", shops);
        data.put("total", total);
        data.put("pageNum", pageNum);
        data.put("pageSize", pageSize);
        data.put("totalPages", totalPages);
        data.put("hasNextPage", pageNum < totalPages);
        data.put("hasPreviousPage", pageNum > 1);
        
        return ResponseResult.success(data);
    }
    
    @Override
    public boolean checkShopName(String name) {
        Shop shop = shopMapper.findByName(name);
        return shop != null;
    }

    @Override
    public List<Shop> getPendingShops() {
        return shopMapper.findPending();
    }
}