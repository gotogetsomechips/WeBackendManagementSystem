package store.service;

import store.bean.User;
import store.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int login(String username, String password) {
        User user = userMapper.findByUsername(username);

        // 用户不存在
        if (user == null) {
            return 1;
        }

        // 账户已锁定
        if (user.getStatus() == 1) {
            return 3;
        }

        // 密码错误
        if (!password.equals(user.getPassword())) {
            // 更新登录失败次数
            int attempts = user.getLoginAttempts() + 1;
            updateLoginAttempts(user.getId(), attempts);

            // 登录失败次数达到6次，锁定账户
            if (attempts >= 6) {
                lockUser(user.getId());
            }

            return 2;
        }

        // 登录成功，重置登录失败次数并更新最后登录时间
        updateLoginAttempts(user.getId(), 0);
        updateLastLoginTime(user.getId());

        return 0;
    }

    @Override
    public User getUserByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public void updateLoginAttempts(Integer id, Integer loginAttempts) {
        userMapper.updateLoginAttempts(id, loginAttempts);
    }
    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public User getUserByEmail(String email) {
        // 需要在UserMapper中添加对应方法
        return userMapper.findByEmail(email);
    }
    @Override
    public void lockUser(Integer id) {
        userMapper.updateUserStatus(id, 1); // 1表示锁定
    }

    @Override
    public void unlockUser(Integer id) {
        userMapper.updateUserStatus(id, 0); // 0表示正常
    }

    @Override
    public void updateLastLoginTime(Integer id) {
        userMapper.updateLastLoginTime(id, new Date());
    }

    @Override
    public boolean needCaptcha(String username) {
        User user = userMapper.findByUsername(username);
        if (user == null) {
            return false;
        }
        return user.getLoginAttempts() >= 3;
    }
}