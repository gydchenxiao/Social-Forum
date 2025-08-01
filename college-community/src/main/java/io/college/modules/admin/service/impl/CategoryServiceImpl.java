/**
 * -----------------------------------
 * //社交论坛开源版本请务必保留此注释头信息
 * 开源地址: https://gitee.com/virus010101/college-community
 * 商业版详情查看: https://www.college.tech
 * 商业版购买联系技术客服
 * QQ:  3582996245
 * 可正常分享和学习源码，不得转卖或非法牟利！
 * Copyright (c) 2021-2023 college all rights reserved.
 * 版权所有 ，侵权必究！
 * -----------------------------------
 */
package io.college.modules.admin.service.impl;

import io.college.common.exception.collegeException;
import io.college.modules.admin.entity.PostEntity;
import io.college.modules.admin.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.college.common.utils.PageUtils;
import io.college.common.utils.Query;

import io.college.modules.admin.dao.CategoryDao;
import io.college.modules.admin.entity.CategoryEntity;
import io.college.modules.admin.service.CategoryService;
import org.springframework.transaction.annotation.Transactional;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    @Autowired
    private PostService postService;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    /**
     * 分类保存
     *
     * @param category
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveCategory(CategoryEntity category) {
        Integer count = this.lambdaQuery()
                .eq(CategoryEntity::getCateName, category.getCateName())
                .count();
        if (count > 0) {
            throw new collegeException("分类名不能重复");
        }
        boolean save = this.save(category);
        if(!save){
            throw new collegeException("分类保存失败");
        }
    }

    /**
     * 删除分类
     *
     * @param list
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByIdList(List<Integer> list) {
        list.forEach(id -> {
            Integer count = postService.lambdaQuery().eq(PostEntity::getCut, id).count();
            if (count > 0) {
                CategoryEntity category = this.getById(id);
                throw new collegeException(category.getCateName() + "分类下存在帖子未删除");
            }
        });
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateCategory(CategoryEntity category) {
        Integer count = this.lambdaQuery()
                .eq(CategoryEntity::getCateName, category.getCateName())
                .count();
        if (count > 1) {
            throw new collegeException("分类名不能重复");
        }
        boolean update = this.updateById(category);
        if(!update){
            throw new collegeException("分类更新失败");
        }
    }


}