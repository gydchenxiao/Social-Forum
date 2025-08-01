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
import io.college.common.utils.AppPageUtils;
import io.college.common.utils.PageUtils;
import io.college.modules.admin.entity.CommentEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-24 21:29:22
 */
public interface CommentService extends IService<CommentEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void deleteByAdmin(List<Long> longs);

    Integer getCountByPostId(Integer id);

    AppPageUtils queryCommentPage(Integer postId, Integer page);

    Integer getYesterdayCount();

    Integer getAllCount();
}

