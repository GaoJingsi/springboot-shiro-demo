package com.github.smartbussinesssys.shiro;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class FilterChainDefinitionMapBuilder {

    //写一个方法 返回map
    @Bean
    public Map createFilterChainDefinitionMap() {

        Map filterChainDefinitionMap = new LinkedHashMap();
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/management/account/login", "anon");
        //<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
//        filterChainDefinitionMap.put("/**", "authc");
        //配置退出 过滤器,其中的具体的退出代码Shiro已经替我们实现了
//        filterChainDefinitionMap.put("/management/account/logout", "authc");
        //filterChainDefinitionMap.put("/management/employee/index", "perms[employee:index]");
        //需要权限才能访问
        //mp.put("/s/permission.jsp", "perms[user:*]");
//        所有页面的权限
        filterChainDefinitionMap.put("//**", "authc");

        return filterChainDefinitionMap;

    }


}
