package com.github.smartbussinesssys;

//import org.apache.velocity.Template;
//import org.apache.velocity.VelocityContext;
//import org.apache.velocity.app.Velocity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SmartbussinesssysApplication.class)
public class ThymeleafTest {

    //    Thymeleaf模板引擎用的变量
    public static final String TEMPLATE_PREFIX = "static/templatefiles/";
    public static final String TEMPLATE_SUFFIX = ".html";

    //    Velocity用的变量
    //生成路径
    private static final String SRC = "src/main/java/";
    private static final String PACKAGE = "com/github/smartbussinesssys/";
    private static final String TEST = "src/test/java/";
    private static final String WEBAPP = "src/main/resources/templates";
    private static final String WEBRESOURCES = "src/main/resources/static";

    //准备路径
    String[] paths = {
            SRC + PACKAGE + "repository/",
            SRC + PACKAGE + "service/", SRC + PACKAGE + "service/impl/",
            SRC + PACKAGE + "web/controller/management", TEST + PACKAGE,
            WEBAPP + "management/template/", WEBRESOURCES + "js/template/"
    };

    //准备文件名
    String[] templateNames = {"TemplateRepository.java",
            "ITemplateService.java", "TemplateServiceImpl.java",
            "TemplateController.java",
            "index.html", "index.js"};

    //准备template
    String[] templates = {"Depot"};


    @Test
    public void printByThymeleaf() {
//        构造模板引擎
        ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
        resolver.setPrefix(TEMPLATE_PREFIX);
        resolver.setSuffix(TEMPLATE_SUFFIX);

        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.setTemplateResolver(resolver);

//        填充数据
        Context context = new Context();
        context.setVariable("msg", "world");

//        输出文件
        FileWriter writer = null;
        try {
            writer = new FileWriter("src/test/java/com/github/smartbussinesssys/1.html");
        } catch (IOException e) {
            e.printStackTrace();
        }
        templateEngine.process("temp", context, writer);
        try {
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    @Test
//    public void printByVelocity() {
////        构造模板引擎
//        Template template = Velocity.getTemplate("templatefiles/tempVelocity.html", "UTF-8");
//
////        填充数据
//        VelocityContext context = new VelocityContext();
//        context.put("msg", "velocity");
//
////        输出文件
//        StringWriter writer = new StringWriter();
//        template.merge(context, writer);
//        System.out.println(writer.toString());
//        try {
//            writer.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }


//    @Test
//    public void generateClasses() {
//        VelocityContext context = new VelocityContext();
//        //循环templates
//        for (int i = 0; i < templates.length; i++) {
//            //大写template名称
//            String templateUpperCase = templates[i];
//            //小写的名称
//            String templateLowerCase = templateUpperCase.substring(0, 1).toLowerCase() + templateUpperCase.substring(1);
//            context.put("Template", templateUpperCase);
//            context.put("template", templateLowerCase);
//
//            for (int j = 0; j < paths.length; j++) {
//
//                String path = paths[j];
//                String templateName = templateNames[j];
//                //src/main/java/DeptQuery.java
//                String realPath = (path + templateName).replaceAll("Template", templateUpperCase)
//                        .replaceAll("template", templateLowerCase);
//
//                //生成文件:
//                Template template = Velocity.getTemplate("templatefiles/" + templateName, "UTF-8");
//                //文件准备
//                File file = new File(realPath);
//                //如果父目录不存在 创建目录
//                File parentFile = file.getParentFile();
//                if (!parentFile.exists()) {
//                    parentFile.mkdirs();
//                }
//
//
//                //FileWriter fileWriter = new FileWriter(file);
//                StringWriter write = new StringWriter();
//                template.merge(context, write);
//                try {
//                    write.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//
//            }
//        }
//    }
}
