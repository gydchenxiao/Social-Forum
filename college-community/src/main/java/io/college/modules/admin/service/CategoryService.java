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
package io.college.modules.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.college.common.utils.PageUtils;
import io.college.modules.admin.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-21 14:32:52
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveCategory(CategoryEntity category);

    void deleteByIdList(List<Integer> list);

    void updateCategory(CategoryEntity category);
}

