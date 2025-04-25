package store.mapper;

import store.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    // 根据用户名查询用户
    User findByUsername(String username);

    // 更新用户登录尝试次数
    void updateLoginAttempts(@Param("id") Integer id, @Param("loginAttempts") Integer loginAttempts);

    // 更新用户状态（锁定/解锁）
    void updateUserStatus(@Param("id") Integer id, @Param("status") Integer status);

    // 更新最后登录时间
    void updateLastLoginTime(@Param("id") Integer id, @Param("lastLoginTime") java.util.Date lastLoginTime);
    // 根据邮箱查询用户
    User findByEmail(String email);
    // 添加用户
    void addUser(User user);

    // 获取所有用户（管理员使用）
    java.util.List<User> getAllUsers();

    // 根据ID查询用户
    User findById(Integer id);
}