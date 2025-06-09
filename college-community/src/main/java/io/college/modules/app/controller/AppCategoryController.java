package io.college.modules.app.controller;

import io.college.common.utils.R;
import io.college.modules.admin.entity.CategoryEntity;
import io.college.modules.admin.service.CategoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author college
 * @date 2022/9/4 10:06
 */
@Api(tags = "用户端——分类")
@RestController
@RequestMapping("app/category")
public class AppCategoryController {


    @Autowired
    private CategoryService categoryService;



    @GetMapping("/classList")
    @ApiOperation("分类列表")
    public R classList(){
        List<CategoryEntity> list = categoryService.list();
        return R.ok().put("result",list);
    }
}
