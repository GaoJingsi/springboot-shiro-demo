package com.github.smartbussinesssys.web.controller.management;

import com.github.smartbussinesssys.domain.Employee;
import com.github.smartbussinesssys.domain.UIPage;
import com.github.smartbussinesssys.service.IDepartmentService;
import com.github.smartbussinesssys.service.IEmployeeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/management/employee")
public class EmployeeController extends BaseController {

    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDepartmentService departmentService;

    @GetMapping("/index")
    @RequiresPermissions("employee:index")
    public String index() {
        return "management/employee/index";
    }

    @PostMapping("/getemployees")
    @ResponseBody
    @RequiresPermissions("employee:page")
    public UIPage<Employee> getEmployees(int page, int rows, String username, String email, Integer departmentId) {
        UIPage<Employee> employees = employeeService.search_Page(page - 1, rows, username, email, departmentId);
        return employees;
    }

    /**
     * 删除员工
     * @param id 员工ID
     * @return 删除后要显示的JSON信息
     */
    @PostMapping("/delete")
    @ResponseBody
    @RequiresPermissions("employee:delete")
    public Map<String, Object> delete(Long id) {
        Map<String, Object> map = new HashMap<>();
        try {
            employeeService.delete(id);
            map.put(SUCCESS, true);
            map.put("msg", "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(SUCCESS, false);
            map.put("msg", "删除失败！原因：" + e.getMessage());
        }
        return map;
    }

    /**
     * 新增或修改员工信息，有部门ID则是修改，无则是新增
     * @param employee 员工实体
     * @param departmentId 部门ID
     * @return JSON数据，指示请求是否成功，和相应操作后的信息
     */
    @PostMapping("/save")
    @ResponseBody
    @RequiresPermissions("employee:save")
    public Map<String, Object> save(Employee employee, Long departmentId) {
        Map<String, Object> map = new HashMap<>();
        try {
            employee.setDepartment(departmentService.find(departmentId));
            employeeService.save(employee);
            map.put(SUCCESS, true);
            map.put("msg", "保存成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(SUCCESS, false);
            map.put("msg", "保存失败！原因：" + e.getMessage());
        }
        return map;
    }

    @PostMapping("/isusernameunique")
    @ResponseBody
    public Map<String, Object> isUsernameUnique(String username) {
        Map<String, Object> map = new HashMap<>();
        try {
            map.put(SUCCESS, true);
            if (employeeService.findByUsername(username).size() == 0) {
                map.put("msg", true);
            } else {
                map.put("msg", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put(SUCCESS, false);
            map.put("msg", "保存失败！原因：" + e.getMessage());
        }
        return map;
    }
}
