//
package io.college.common.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author college
 * @email 3582996245@qq.com
 * @date 2022-01-20 12:10:43
 */
@Data
@JsonIgnoreProperties(value = {"password"})
public class TopicUserResponse implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	@TableId
	private Integer uid;
	/**
	 * 手机号
	 */
	private String mobile;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 用户组
	 */
	private Integer groupId;
	/**
	 * 头像
	 */
	private String avatar;
	/**
	 * 性别(0未知，1男，2女)
	 */
	private Integer gender;
	/**
	 * 省份
	 */
	private String province;
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 小程序openid
	 */
	private String openid;
	/**
	 * 公众号openid
	 */
	private String mpOpenid;
	/**
	 * unionid
	 */
	private String unionid;
	/**
	 * 状态
	 */
	private Integer status;
	/**
	 * 个性签名
	 */
	private String intro;
	/**
	 * 积分
	 */
	private Integer integral;
	/**
	 * 最后登录ip
	 */
	private String lastLoginIp;
	/**
	 * 用户标签
	 */
	private String tagStr;
	/**
	 * 0为普通用户  1官方账号 2马甲虚拟用户
	 */
	private Integer type;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 是否为圈主或管理员
	 */
	private Boolean isAdmin;

	/**
	 * 0  关注
	 * 1  互相关注
	 * 2  已关注
	 */
	private Integer hasFollow;
}
