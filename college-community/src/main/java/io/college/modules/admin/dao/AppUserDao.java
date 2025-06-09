
package io.college.modules.admin.dao;

import io.college.modules.admin.entity.AppUserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface AppUserDao extends BaseMapper<AppUserEntity> {
	
}
