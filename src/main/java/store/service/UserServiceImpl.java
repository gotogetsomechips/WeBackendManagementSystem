package store.service;

import store.bean.User;
import store.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int login(String username, String password) {
        User user = userMapper.findByUsername(username);

        if (user == null) {
            return 1; // 用户名不存在
        }

        if (user.getStatus() == 1) {
            return 3; // 账户已锁定
        }

        if (!password.equals(user.getPassword())) {
            int attempts = user.getLoginAttempts() + 1;
            updateLoginAttempts(user.getId(), attempts);

            if (attempts >= 6) {
                lockUser(user.getId());
                return 3; // 账户已锁定
            }

            return 2; // 密码错误
        }

        updateLoginAttempts(user.getId(), 0);
        updateLastLoginTime(user.getId());
        return 0; // 登录成功
    }

    @Override
    public void lockUser(Integer id) {
        userMapper.updateUserStatus(id, 1); // 1 表示锁定状态
        userMapper.updateLoginAttempts(id, 0); // 锁定后重置尝试次数
    }

    @Override
    public User getUserByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public User getUserByEmail(String email) {
        return userMapper.findByEmail(email);
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.findById(id);
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.getAllUsers();
    }

    @Override
    public List<User> getUsersByPage(int page, int limit, String username, Integer status, String userLevel, Date startTime, Date endTime, String sortField, String sortOrder) {
        int offset = (page - 1) * limit;
        return userMapper.getUsersByPage(offset, limit, username, status, userLevel, startTime, endTime, sortField, sortOrder);
    }

    @Override
    public int countUsers(String username, Integer status, String userLevel, Date startTime, Date endTime) {
        return userMapper.countUsers(username, status, userLevel, startTime, endTime);
    }

    @Override
    @Transactional
    public void addUser(User user) {
        if (userMapper.checkUsernameExists(user.getUsername(), null)) {
            throw new RuntimeException("用户名已存在");
        }
        user.setCreateTime(new Date());
        userMapper.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        if (userMapper.checkUsernameExists(user.getUsername(), user.getId())) {
            throw new RuntimeException("用户名已存在");
        }
        userMapper.updateUser(user);
    }

    @Override
    @Transactional
    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
    }

    @Override
    @Transactional
    public void batchDeleteUsers(List<Integer> ids) {
        if (ids != null && !ids.isEmpty()) {
            userMapper.batchDeleteUsers(ids);
        }
    }

    @Override
    public void updateLoginAttempts(Integer id, Integer loginAttempts) {
        userMapper.updateLoginAttempts(id, loginAttempts);
    }

    @Override
    public void updateUserStatus(Integer id, Integer status) {
        userMapper.updateUserStatus(id, status);
    }

    @Override
    public void updateLastLoginTime(Integer id) {
        userMapper.updateLastLoginTime(id, new Date());
    }

    @Override
    public void unlockUser(Integer id) {
        userMapper.updateUserStatus(id, 0);
        userMapper.updateLoginAttempts(id, 0);
    }

    @Override
    public boolean checkUsernameExists(String username, Integer excludeId) {
        return userMapper.checkUsernameExists(username, excludeId);
    }

    @Override
    public boolean needCaptcha(String username) {
        User user = userMapper.findByUsername(username);
        return user != null && user.getLoginAttempts() >= 3;
    }
}