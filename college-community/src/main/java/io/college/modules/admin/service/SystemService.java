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
import io.college.modules.admin.entity.AppUserEntity;
import io.college.modules.admin.entity.SystemEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 
 *
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-19 16:29:48
 */
public interface SystemService extends IService<SystemEntity> {

    PageUtils queryPage(Map<String, Object> params);

    SystemEntity miniConfig();
}

