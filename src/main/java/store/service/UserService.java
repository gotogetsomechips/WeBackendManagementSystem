package store.service;

import store.bean.User;

import java.util.Date;
import java.util.List;

public interface UserService {
    int login(String username, String password);
    User getUserByUsername(String username);
    User getUserByEmail(String email);
    User getUserById(Integer id);

    List<User> getAllUsers();
    List<User> getUsersByPage(int page, int limit, String username, Integer status, String userLevel, Date startTime, Date endTime, String sortField, String sortOrder);
    int countUsers(String username, Integer status, String userLevel, Date startTime, Date endTime);

    void addUser(User user);
    void updateUser(User user);
    void deleteUser(Integer id);
    void batchDeleteUsers(List<Integer> ids);

    void updateLoginAttempts(Integer id, Integer loginAttempts);
    void updateUserStatus(Integer id, Integer status);
    void updateLastLoginTime(Integer id);
    void unlockUser(Integer id);

    boolean checkUsernameExists(String username, Integer excludeId);
    boolean needCaptcha(String username);

    void lockUser(Integer id);
}