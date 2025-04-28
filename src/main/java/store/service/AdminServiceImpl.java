package store.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.bean.Admin;
import store.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Admin> getAllAdmins() {
        return adminMapper.getAllAdmins();
    }

    @Override
    public List<Admin> findAdminsByCondition(Map<String, Object> params) {
        return adminMapper.findAdminsByCondition(params);
    }

    @Override
    public void addAdmin(Admin admin) {
        Date now = new Date();
        admin.setCreateTime(now);
        admin.setUpdateTime(now);

        // 检查登录名是否已存在（已在Controller层校验，此处可省略）
        adminMapper.addAdmin(admin);
    }

    @Override
    public void updateAdmin(Admin admin) {
        admin.setUpdateTime(new Date());
        adminMapper.updateAdmin(admin);
    }

    @Override
    public void deleteAdmin(Integer id) {
        adminMapper.deleteAdmin(id);
    }

    @Override
    public void batchDeleteAdmins(List<Integer> ids) {
        adminMapper.batchDeleteAdmins(ids);
    }

    @Override
    public Admin findById(Integer id) {
        return adminMapper.findById(id);
    }

    @Override
    public boolean checkUsernameExists(String username) {
        return adminMapper.checkUsernameExists(username) > 0;
    }

    @Override
    public boolean checkSortOrderExists(Integer sortOrder) {
        return adminMapper.checkSortOrderExists(sortOrder) > 0;
    }

    @Override
    public List<Map<String, Object>> getAllRoles() {
        return adminMapper.getAllRoles();
    }

    @Override
    public int getAdminCount(Map<String, Object> params) {
        return adminMapper.getAdminCount(params);
    }
}