package com.github.smartbussinesssys.shiro;

import com.github.smartbussinesssys.domain.Employee;
import com.github.smartbussinesssys.domain.Permission;
import com.github.smartbussinesssys.service.IEmployeeService;
import com.github.smartbussinesssys.service.IPermissionService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

//实现AuthorizingRealm接口用户用户认证
public class MyShiroRealm extends AuthorizingRealm {

    private static final ByteSource salt = ByteSource.Util.bytes("itsource");

    //用于用户查询
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IPermissionService permissionService;

    //角色权限和对应权限添加
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录用户名
        String name = (String) principalCollection.getPrimaryPrincipal();
        //查询用户名称
        List<Employee> employees = employeeService.findByUsername(name);
        Employee employee = employees.get(0);

//      查询用户权限
        List<Permission> permissions = permissionService.findPermissionsByEmpId(employee.getId());

        //添加角色和权限
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();

        for (Permission permission :
                permissions) {
            simpleAuthorizationInfo.addStringPermission(permission.getSn());
        }
//        simpleAuthorizationInfo.addStringPermission("employee:index");

        return simpleAuthorizationInfo;
    }

    //用户认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //加这一步的目的是在Post请求的时候会先进认证，然后在到请求
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }
        //获取用户信息
        String name = authenticationToken.getPrincipal().toString();
        List<Employee> employees = employeeService.findByUsername(name);
        if (employees.size() == 0) {
            //这里返回后会报出对应异常
            return null;
        } else {
            //SimpleHash simpleHash = new SimpleHash("MD5", employees.get(0).getPassword(),salt, 10);
            //System.out.println(simpleHash.toString());
            //这里验证authenticationToken和simpleAuthenticationInfo的信息
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(name, employees.get(0).getPassword().toString(), salt, getName());
            return simpleAuthenticationInfo;
        }
    }
}