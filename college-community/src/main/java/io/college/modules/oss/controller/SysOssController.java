
package io.college.modules.oss.controller;

import com.google.gson.Gson;
import io.college.common.exception.collegeException;
import io.college.common.utils.*;
import io.college.common.validator.ValidatorUtils;
import io.college.common.validator.group.AliyunGroup;
import io.college.common.validator.group.QcloudGroup;
import io.college.common.validator.group.QiniuGroup;
import io.college.modules.oss.cloud.CloudStorageConfig;
import io.college.modules.oss.cloud.OSSFactory;
import io.college.modules.oss.entity.SysOssEntity;
import io.college.modules.oss.service.SysOssService;
import io.college.modules.sys.service.SysConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;
@RestController
@RequestMapping("sys/oss")
@Api(tags = "文件上传")
public class SysOssController {
	@Value("${oss.admin-max-size}")
	private Long maxSize;
	@Autowired
	private SysOssService sysOssService;
    @Autowired
    private SysConfigService sysConfigService;
    private final static String KEY = ConfigConstant.CLOUD_STORAGE_CONFIG_KEY;
	@ApiOperation("文件列表")
	@GetMapping("/list")
	@RequiresPermissions("sys:oss:all")
	public R list(@RequestParam Map<String, Object> params){
		PageUtils page = sysOssService.queryPage(params);
		return R.ok().put("page", page);
	}
	@ApiOperation("云存储配置信息")
    @GetMapping("/config")
    @RequiresPermissions("sys:oss:all")
    public R config(){
        CloudStorageConfig config = sysConfigService.getConfigObject(KEY, CloudStorageConfig.class);
        return R.ok().put("config", config);
    }
	@ApiOperation("保存云存储配置信息")
	@PostMapping("/saveConfig")
	@RequiresPermissions("sys:oss:all")
	public R saveConfig(@RequestBody CloudStorageConfig config){
		//校验类型
		ValidatorUtils.validateEntity(config);

		if(config.getType() == Constant.CloudService.QINIU.getValue()){
			//校验七牛数据
			ValidatorUtils.validateEntity(config, QiniuGroup.class);
		}else if(config.getType() == Constant.CloudService.ALIYUN.getValue()){
			//校验阿里云数据
			ValidatorUtils.validateEntity(config, AliyunGroup.class);
		}else if(config.getType() == Constant.CloudService.QCLOUD.getValue()){
			//校验腾讯云数据
			ValidatorUtils.validateEntity(config, QcloudGroup.class);
		}
        sysConfigService.updateValueByKey(KEY, new Gson().toJson(config));
		return R.ok();
	}
	@ApiOperation("上传文件")
	@PostMapping("/upload")
	@RequiresPermissions("sys:oss:all")
	public R upload(@RequestParam("file") MultipartFile file) throws Exception {
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
		return R.ok().put("url", url);
	}
	/**
	 * 删除
	 */
	@ApiOperation("删除")
	@PostMapping("/delete")
	@RequiresPermissions("sys:oss:all")
	public R delete(@RequestBody Long[] ids){
		sysOssService.removeByIds(Arrays.asList(ids));

		return R.ok();
	}

}
