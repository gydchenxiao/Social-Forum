/**
 * -----------------------------------
 * //社交论坛开源版本请务必保留此注释头信息
 * 开源地址: https://gitee.com/virus010101/college-community
 * 演示站点: https://www.college.tech
 * 可正常分享和学习源码，不得用于非法牟利！
 * 商业版购买联系技术客服  QQ: 3582996245
 * Copyright (c) 2021-2023 college all rights reserved.
 * 版权所有 ，侵权必究！
 * -----------------------------------
 */
package io.college.modules.app.dao;

import io.college.modules.app.entity.PostCollectionEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-24 20:49:32
 */
@Mapper
public interface PostCollectionDao extends BaseMapper<PostCollectionEntity> {
	
}
