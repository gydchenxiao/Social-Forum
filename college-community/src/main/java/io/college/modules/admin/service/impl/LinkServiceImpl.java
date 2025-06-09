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

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.college.common.utils.PageUtils;
import io.college.common.utils.Query;

import io.college.modules.admin.dao.LinkDao;
import io.college.modules.admin.entity.LinkEntity;
import io.college.modules.admin.service.LinkService;


@Service("linkService")
public class LinkServiceImpl extends ServiceImpl<LinkDao, LinkEntity> implements LinkService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<LinkEntity> page = this.page(
                new Query<LinkEntity>().getPage(params),
                new QueryWrapper<>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<LinkEntity> getList() {
        List<LinkEntity> list = this.list();
        return list;
    }

}