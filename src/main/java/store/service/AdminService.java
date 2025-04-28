package store.service;

import java.util.List;
import java.util.Map;
import store.bean.Admin;

public interface AdminService {

    /**
     * 获取所有管理员
     */
    List<Admin> getAllAdmins();

    /**
     * 根据条件查询管理员
     */
    List<Admin> findAdminsByCondition(Map<String, Object> params);

    /**
     * 添加管理员
     */
    void addAdmin(Admin admin);

    /**
     * 更新管理员
     */
    void updateAdmin(Admin admin);

    /**
     * 删除管理员
     */
    void deleteAdmin(Integer id);

    /**
     * 批量删除管理员
     */
    void batchDeleteAdmins(List<Integer> ids);

    /**
     * 根据ID查询管理员
     */
    Admin findById(Integer id);

    /**
     * 检查登录名是否存在
     */
    boolean checkUsernameExists(String username);

    /**
     * 检查编号是否存在
     */
    boolean checkSortOrderExists(Integer sortOrder);

    /**
     * 获取所有角色
     */
    List<Map<String, Object>> getAllRoles();

    /**
     * 获取管理员总数
     */
    int getAdminCount(Map<String, Object> params);
}