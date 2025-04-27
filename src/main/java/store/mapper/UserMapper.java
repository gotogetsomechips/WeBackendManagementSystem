package store.mapper;

import store.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface UserMapper {
    User findByUsername(String username);
    User findByEmail(String email);
    User findById(Integer id);

    List<User> getAllUsers();
    List<User> getUsersByPage(@Param("offset") int offset,
                              @Param("limit") int limit,
                              @Param("username") String username,
                              @Param("status") Integer status,
                              @Param("userLevel") String userLevel,
                              @Param("startTime") Date startTime,
                              @Param("endTime") Date endTime,
                              @Param("sortField") String sortField,
                              @Param("sortOrder") String sortOrder);

    int countUsers(@Param("username") String username,
                   @Param("status") Integer status,
                   @Param("userLevel") String userLevel,
                   @Param("startTime") Date startTime,
                   @Param("endTime") Date endTime);

    void addUser(User user);
    void updateUser(User user);
    void deleteUser(Integer id);
    void batchDeleteUsers(@Param("ids") List<Integer> ids);

    void updateLoginAttempts(@Param("id") Integer id, @Param("loginAttempts") Integer loginAttempts);
    void updateUserStatus(@Param("id") Integer id, @Param("status") Integer status);
    void updateLastLoginTime(@Param("id") Integer id, @Param("lastLoginTime") Date lastLoginTime);

    boolean checkUsernameExists(@Param("username") String username, @Param("excludeId") Integer excludeId);

}