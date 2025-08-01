//
package io.college.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.college.common.utils.PageUtils;
import io.college.modules.admin.entity.AppUserEntity;
import io.college.modules.app.entity.FollowEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-24 14:38:31
 */
public interface FollowService extends IService<FollowEntity> {

    PageUtils queryPage(Map<String, Object> params);

    Integer getFollowCount(Integer uid);

    Integer getFans(Integer uid);

    boolean isFollowOrNot(Integer uid, Integer id);

    List<Integer> getFollowUid(AppUserEntity user);

    List<Integer> getFollowUids(AppUserEntity user);

    Integer isFollow(Integer uid,Integer followUid);

    List<Integer> getFansList(Integer uid);
}

