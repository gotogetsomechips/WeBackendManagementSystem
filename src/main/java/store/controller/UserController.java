package store.controller;

import org.springframework.format.annotation.DateTimeFormat;
import store.bean.User;
import store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String userList() {
        return "user_list";
    }

    @GetMapping("/data")
    @ResponseBody
    public Map<String, Object> getUserData(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit,
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "status", required = false) Integer status,
            @RequestParam(value = "userLevel", required = false) String userLevel,
            @RequestParam(value = "startTime", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startTime,
            @RequestParam(value = "endTime", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endTime,
            @RequestParam(value = "sortField", required = false) String sortField,
            @RequestParam(value = "sortOrder", required = false) String sortOrder) {

        Map<String, Object> result = new HashMap<>();
        List<User> users = userService.getUsersByPage(page, limit, username, status, userLevel, startTime, endTime, sortField, sortOrder);
        int count = userService.countUsers(username, status, userLevel, startTime, endTime);

        result.put("code", 0);
        result.put("msg", "");
        result.put("count", count);
        result.put("data", users);

        return result;
    }

    @PostMapping("/add")
    @ResponseBody
    public Map<String, Object> addUser(User user) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 验证必填字段
            if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
                throw new RuntimeException("用户名不能为空");
            }
            if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
                throw new RuntimeException("密码不能为空");
            }
            if (user.getPassword().length() < 8) {
                throw new RuntimeException("密码长度不能少于8位");
            }
            if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
                throw new RuntimeException("邮箱不能为空");
            }
            if (!user.getEmail().matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
                throw new RuntimeException("邮箱格式不正确");
            }
            if (user.getPhone() != null && !user.getPhone().isEmpty() && !user.getPhone().matches("^1[3-9]\\d{9}$")) {
                throw new RuntimeException("手机号格式不正确");
            }

            // 检查用户名是否已存在
            if (userService.checkUsernameExists(user.getUsername(), null)) {
                throw new RuntimeException("用户名已存在");
            }

            userService.addUser(user);
            result.put("success", true);
            result.put("message", "添加用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @GetMapping("/get")
    @ResponseBody
    public Map<String, Object> getUser(@RequestParam Integer id) {
        Map<String, Object> result = new HashMap<>();
        try {
            User user = userService.getUserById(id);
            if (user != null) {
                result.put("success", true);
                result.put("data", user);
            } else {
                result.put("success", false);
                result.put("message", "用户不存在");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> updateUser(User user) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 验证必填字段
            if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
                throw new RuntimeException("用户名不能为空");
            }
            if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
                throw new RuntimeException("邮箱不能为空");
            }
            if (!user.getEmail().matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
                throw new RuntimeException("邮箱格式不正确");
            }
            if (user.getPhone() != null && !user.getPhone().isEmpty() && !user.getPhone().matches("^1[3-9]\\d{9}$")) {
                throw new RuntimeException("手机号格式不正确");
            }

            // 检查用户名是否已存在（排除当前用户）
            if (userService.checkUsernameExists(user.getUsername(), user.getId())) {
                throw new RuntimeException("用户名已存在");
            }

            // 如果密码不为空且长度小于8位
            if (user.getPassword() != null && !user.getPassword().isEmpty() && user.getPassword().length() < 8) {
                throw new RuntimeException("密码长度不能少于8位");
            }

            userService.updateUser(user);
            result.put("success", true);
            result.put("message", "更新用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleteUser(@RequestParam Integer id) {
        Map<String, Object> result = new HashMap<>();
        try {
            userService.deleteUser(id);
            result.put("success", true);
            result.put("message", "删除用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @PostMapping("/batchDelete")
    @ResponseBody
    public Map<String, Object> batchDeleteUsers(@RequestParam("ids[]") List<Integer> ids) {
        Map<String, Object> result = new HashMap<>();
        try {
            userService.batchDeleteUsers(ids);
            result.put("success", true);
            result.put("message", "批量删除用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @PostMapping("/lock")
    @ResponseBody
    public Map<String, Object> lockUser(@RequestParam Integer id) {
        Map<String, Object> result = new HashMap<>();
        try {
            userService.updateUserStatus(id, 1);
            result.put("success", true);
            result.put("message", "锁定用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @PostMapping("/unlock")
    @ResponseBody
    public Map<String, Object> unlockUser(@RequestParam Integer id) {
        Map<String, Object> result = new HashMap<>();
        try {
            userService.unlockUser(id);
            result.put("success", true);
            result.put("message", "解锁用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @PostMapping("/disable")
    @ResponseBody
    public Map<String, Object> disableUser(@RequestParam Integer id) {
        Map<String, Object> result = new HashMap<>();
        try {
            userService.updateUserStatus(id, 2);
            result.put("success", true);
            result.put("message", "禁用用户成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @GetMapping("/checkUsername")
    @ResponseBody
    public Map<String, Object> checkUsernameExists(
            @RequestParam String username,
            @RequestParam(required = false) Integer excludeId) {
        Map<String, Object> result = new HashMap<>();
        boolean exists = userService.checkUsernameExists(username, excludeId);
        result.put("exists", exists);
        return result;
    }
}