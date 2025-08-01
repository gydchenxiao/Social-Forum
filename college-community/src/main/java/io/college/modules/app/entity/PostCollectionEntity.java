//
package io.college.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * 
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-24 20:49:32
 */
@Data
@TableName("lf_post_collection")
public class PostCollectionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
//	@TableId
	private Integer uid;
	/**
	 * 帖子id
	 */
	private Integer postId;

}
