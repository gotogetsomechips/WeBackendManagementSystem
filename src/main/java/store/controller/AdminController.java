package store.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import store.bean.Admin;
import store.service.AdminService;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 管理员列表页面
     */
    @RequestMapping("/Admin_list")
    public String adminList(Model model) {
        // 获取所有角色
        List<Map<String, Object>> roles = adminService.getAllRoles();
        model.addAttribute("roles", roles);
        return "Admin_list";
    }

    /**
     * 获取管理员列表数据
     */
    @RequestMapping("/getAdminList")
    @ResponseBody
    public Map<String, Object> getAdminList(
            @RequestParam(value = "username", required = false) String username,
            @RequestParam(value = "roleId", required = false) Integer roleId,
            @RequestParam(value = "status", required = false) Integer status,
            @RequestParam(value = "startTime", required = false) String startTime,
            @RequestParam(value = "endTime", required = false) String endTime,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit,
            @RequestParam(value = "sortField", required = false) String sortField,
            @RequestParam(value = "sortOrder", required = false) String sortOrder) {

        if (startTime != null && startTime.trim().isEmpty()) {
            startTime = null;
        }
        if (endTime != null && endTime.trim().isEmpty()) {
            endTime = null;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("username", username);
        params.put("roleId", roleId);
        params.put("status", status);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("start", (page - 1) * limit);
        params.put("limit", limit);
        params.put("sortField", sortField);
        params.put("sortOrder", sortOrder == null ? "asc" : sortOrder);

        List<Admin> adminList = adminService.findAdminsByCondition(params);
        int total = adminService.getAdminCount(params);

        Map<String, Object> result = new HashMap<>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", total);
        result.put("data", adminList);

        return result;
    }

    /**
     * 添加管理员
     */
    @RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addAdmin(Admin admin) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 检查必填字段
            if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "登录名不能为空");
                return result;
            }
            if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "密码不能为空");
                return result;
            }
            // 密码长度验证
            if (admin.getPassword().length() < 8) {
                result.put("success", false);
                result.put("message", "密码长度不能少于8位");
                return result;
            }
            if (admin.getRoleId() == null) {
                result.put("success", false);
                result.put("message", "请选择角色");
                return result;
            }
            if (admin.getSortOrder() == null) {
                result.put("success", false);
                result.put("message", "编号不能为空");
                return result;
            }
            if (admin.getRealName() == null || admin.getRealName().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "真实姓名不能为空");
                return result;
            }
            if (admin.getMobile() == null || admin.getMobile().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "手机号不能为空");
                return result;
            }
            // 手机号格式验证
            if (!admin.getMobile().matches("^1[3-9]\\d{9}$")) {
                result.put("success", false);
                result.put("message", "手机号格式不正确");
                return result;
            }
            if (admin.getEmail() == null || admin.getEmail().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "邮箱不能为空");
                return result;
            }
            // 邮箱格式验证
            if (!admin.getEmail().matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
                result.put("success", false);
                result.put("message", "邮箱格式不正确");
                return result;
            }


            // 检查编号是否已存在
            if (adminService.checkSortOrderExists(admin.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            // 设置默认状态为启用
            admin.setStatus(1);
            adminService.addAdmin(admin);

            result.put("success", true);
            result.put("message", "添加成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "添加失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 检查编号是否存在
     */
    @RequestMapping("/admin/checkSortOrderExists")
    @ResponseBody
    public Map<String, Object> checkSortOrderExists(
            @RequestParam Integer sortOrder,
            @RequestParam(required = false) Integer id) {
        Map<String, Object> result = new HashMap<>();
        boolean exists;

        if (id != null) {
            // 编辑时检查，排除当前记录
            Admin admin = adminService.findById(id);
            exists = adminService.checkSortOrderExists(sortOrder) &&
                    !admin.getSortOrder().equals(sortOrder);
        } else {
            // 添加时检查
            exists = adminService.checkSortOrderExists(sortOrder);
        }

        result.put("exists", exists);
        return result;
    }

    /**
     * 检查登录名是否存在
     */
    @RequestMapping("/admin/checkUsernameExists")
    @ResponseBody
    public Map<String, Object> checkUsernameExists(
            @RequestParam String username,
            @RequestParam(required = false) Integer id) {
        Map<String, Object> result = new HashMap<>();
        boolean exists;

        if (id != null) {
            // 编辑时检查，排除当前记录
            Admin admin = adminService.findById(id);
            exists = adminService.checkUsernameExists(username) &&
                    !admin.getUsername().equals(username);
        } else {
            // 添加时检查
            exists = adminService.checkUsernameExists(username);
        }

        result.put("exists", exists);
        return result;
    }

    /**
     * 更新管理员
     */
    @RequestMapping(value = "/updateAdmin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateAdmin(Admin admin) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 获取原管理员信息
            Admin oldAdmin = adminService.findById(admin.getId());
            if (oldAdmin == null) {
                result.put("success", false);
                result.put("message", "管理员不存在");
                return result;
            }

            // 检查必填字段
            if (admin.getRealName() == null || admin.getRealName().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "真实姓名不能为空");
                return result;
            }
            if (admin.getMobile() == null || admin.getMobile().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "手机号不能为空");
                return result;
            }
            // 手机号格式验证
            if (!admin.getMobile().matches("^1[3-9]\\d{9}$")) {
                result.put("success", false);
                result.put("message", "手机号格式不正确");
                return result;
            }
            if (admin.getEmail() == null || admin.getEmail().trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "邮箱不能为空");
                return result;
            }
            // 邮箱格式验证
            if (!admin.getEmail().matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
                result.put("success", false);
                result.put("message", "邮箱格式不正确");
                return result;
            }


            // 检查编号是否已存在（排除自己）
            if (!oldAdmin.getSortOrder().equals(admin.getSortOrder()) && adminService.checkSortOrderExists(admin.getSortOrder())) {
                result.put("success", false);
                result.put("message", "该编号已存在，请使用其他编号");
                return result;
            }

            // 如果密码为空，则保留原密码
            if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
                admin.setPassword(oldAdmin.getPassword());
            } else {
                // 密码长度验证
                if (admin.getPassword().length() < 8) {
                    result.put("success", false);
                    result.put("message", "密码长度不能少于8位");
                    return result;
                }
            }

            adminService.updateAdmin(admin);

            result.put("success", true);
            result.put("message", "更新成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "更新失败：" + e.getMessage());
        }

        return result;
    }
    /**
     * 删除管理员
     */
    @RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteAdmin(Integer id) {
        Map<String, Object> result = new HashMap<>();

        try {
            adminService.deleteAdmin(id);
            result.put("success", true);
            result.put("message", "删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 批量删除管理员
     */
    @RequestMapping(value = "/batchDeleteAdmins", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> batchDeleteAdmins(@RequestParam("ids[]") List<Integer> ids) {
        Map<String, Object> result = new HashMap<>();

        try {
            adminService.batchDeleteAdmins(ids);
            result.put("success", true);
            result.put("message", "批量删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "批量删除失败：" + e.getMessage());
        }

        return result;
    }

    /**
     * 根据ID获取管理员信息
     */
    @RequestMapping("/getAdminById")
    @ResponseBody
    public Map<String, Object> getAdminById(Integer id) {
        Map<String, Object> result = new HashMap<>();

        Admin admin = adminService.findById(id);
        if (admin != null) {
            result.put("success", true);
            result.put("data", admin);
        } else {
            result.put("success", false);
            result.put("message", "管理员不存在");
        }

        return result;
    }

    /**
     * 获取所有角色
     */
    @RequestMapping("/admin/getAllRoles")
    @ResponseBody
    public List<Map<String, Object>> getAllRoles() {
        return adminService.getAllRoles();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}