//
package io.college.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.college.common.utils.PageUtils;
import io.college.modules.admin.entity.AppUserEntity;
import io.college.modules.app.entity.CommentThumbsEntity;
import io.college.modules.app.param.AddThumbsForm;

import java.util.Map;

/**
 * 
 *
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-25 19:00:24
 */
public interface CommentThumbsService extends IService<CommentThumbsEntity> {

    PageUtils queryPage(Map<String, Object> params);

    Boolean isThumbs(Integer uid, Long id);

    Integer getThumbsCount(Long id);

    void addThumbs(AddThumbsForm request, AppUserEntity user);

    void cancelThumbs(AddThumbsForm request, AppUserEntity user);
}

