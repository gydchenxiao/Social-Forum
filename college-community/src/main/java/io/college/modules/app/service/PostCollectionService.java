//
package io.college.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.college.common.utils.PageUtils;
import io.college.modules.admin.entity.AppUserEntity;
import io.college.modules.app.entity.PostCollectionEntity;
import io.college.modules.app.param.AddCollectionForm;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-24 20:49:32
 */
public interface PostCollectionService extends IService<PostCollectionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    Integer collectCount(Integer postId);

    Boolean isCollection(Integer uid,Integer postId);

    void cancelCollection(AddCollectionForm request, AppUserEntity user);

    List<Integer> getPostListByUid(Integer uid);
	
}

