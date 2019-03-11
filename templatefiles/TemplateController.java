package com.github.smartbussinesssys.web.controller.management;

import com.github.smartbussinesssys.domain.${Template};
import com.github.smartbussinesssys.domain.UIPage;
import com.github.smartbussinesssys.service.IDepartmentService;
import com.github.smartbussinesssys.service.I${Template}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/management/${template}")
public class ${Template}Controller extends BaseController {

    @Autowired
    private I${Template}Service ${template}Service;

    @GetMapping("/index")
    public String index() {
        return "management/${template}/index";
    }

    @PostMapping("/get${template}s")
    @ResponseBody
    public UIPage<${Template}> get${Template}s(int page, int rows) {
        UIPage<${Template}> ${template}s = ${template}Service.search_Page(page - 1, rows);
        return ${template}s;
    }

    /**
     * 删除员工
     * @param id 员工ID
     * @return 删除后要显示的JSON信息
     */
    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(Long id) {
        Map<String, Object> map = new HashMap<>();
        try {
            ${template}Service.delete(id);
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
     * @param ${template} 员工实体
     * @param departmentId 部门ID
     * @return JSON数据，指示请求是否成功，和相应操作后的信息
     */
    @PostMapping("/save")
    @ResponseBody
    public Map<String, Object> save(${Template} ${template}) {
        Map<String, Object> map = new HashMap<>();
        try {
            ${template}Service.save(${template});
            map.put(SUCCESS, true);
            map.put("msg", "保存成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(SUCCESS, false);
            map.put("msg", "保存失败！原因：" + e.getMessage());
        }
        return map;
    }
}
