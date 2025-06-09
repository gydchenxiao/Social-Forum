//
package io.college.modules.app.controller;

import io.college.common.exception.collegeException;
import io.college.common.utils.FileCheckUtil;
import io.college.common.utils.R;
import io.college.modules.oss.cloud.OSSFactory;
import io.college.modules.oss.entity.SysOssEntity;
import io.college.modules.oss.service.SysOssService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * APP文件上传
 *
 */
@RestController
@RequestMapping("app/common")
@Api(tags = "App文件上传")
public class AppOssController {

	@Value("${oss.max-size}")
	private Long maxSize;

	@Autowired
	private SysOssService sysOssService;


	@ApiOperation("APP端文件上传")
	@PostMapping("/upload")
	public R upload(@RequestParam("Image") MultipartFile file) throws Exception {
		if (file.isEmpty()) {
			throw new collegeException("上传文件不能为空");
		}
		FileCheckUtil.checkSize(maxSize, file.getSize());
		//上传文件
		String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String url = OSSFactory.build().uploadSuffix(file.getBytes(), suffix);

		//保存文件信息
		SysOssEntity ossEntity = new SysOssEntity();
		ossEntity.setUrl(url);
		ossEntity.setCreateDate(new Date());
		sysOssService.save(ossEntity);

		return R.ok().put("result", url);
	}



}
