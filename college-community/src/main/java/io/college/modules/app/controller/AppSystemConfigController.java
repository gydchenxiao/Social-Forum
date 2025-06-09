//
package io.college.modules.app.controller;

import io.college.common.utils.R;
import io.college.modules.admin.entity.SystemEntity;
import io.college.modules.admin.service.SystemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author college
 * @date 2022/8/17 12:07
 */
@Api(tags = "用户端——系统配置")
@RestController
@RequestMapping("app/system")
public class AppSystemConfigController {

    @Autowired
    private SystemService systemService;


    @ApiOperation("logo配置")
    @GetMapping("/miniConfig")
    public R miniConfig(){
        SystemEntity system = systemService.miniConfig();
        return R.ok().put("logo",system.getIntro());
    }

}
