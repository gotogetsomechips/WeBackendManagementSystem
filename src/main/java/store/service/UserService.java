package store.service;

import store.bean.User;

public interface UserService {

    /**
     * 用户登录验证
     * @param username 用户名
     * @param password 密码
     * @return 登录结果状态码
     * 0: 登录成功
     * 1: 用户名不存在
     * 2: 密码错误
     * 3: 账户已锁定
     */
    int login(String username, String password);

    /**
     * 根据用户名获取用户
     */
    User getUserByUsername(String username);

    /**
     * 更新登录失败次数
     */
    void updateLoginAttempts(Integer id, Integer loginAttempts);

    /**
     * 锁定用户
     */
    void lockUser(Integer id);

    /**
     * 添加用户
     */
    void addUser(User user);

    /**
     * 根据邮箱查询用户
     */
    User getUserByEmail(String email);
    /**
     * 解锁用户
     */
    void unlockUser(Integer id);

    /**
     * 更新最后登录时间
     */
    void updateLastLoginTime(Integer id);

    /**
     * 检查是否需要验证码
     * 当登录失败次数 >= 3时需要验证码
     */
    boolean needCaptcha(String username);


}