
package io.college.modules.app.controller;

import io.college.common.vo.AppUserInfoResponse;
import io.college.common.vo.AppUserRankResponse;
import io.college.common.vo.AppUserResponse;
import io.college.common.utils.AppPageUtils;
import io.college.common.utils.R;
import io.college.modules.admin.entity.AppUserEntity;
import io.college.modules.admin.service.AppUserService;
import io.college.modules.app.annotation.Login;
import io.college.modules.app.annotation.LoginUser;
import io.college.modules.app.param.*;
import io.college.modules.app.utils.JwtUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * APP登录接口
 *
 * @author college
 * @date 2022/6/9 22:40
 */
@RestController
@RequestMapping("/app/user")
@Api(tags = "APP登录接口")
public class AppUserInfoController {


    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private AppUserService appUserService;

    @Value("${sms.open}")
    private boolean isOpen;

    @PostMapping("/sendSmsCode")
    @ApiOperation("测试发送验证码")
    public R sendSmsCode(@RequestBody SendCodeForm param) {
        String code = appUserService.sendSmsCode(param);
        if (isOpen) {
            //TODO
            //send Aliyun Sms code
        }
        return R.ok("测试验证码:" + code);
    }


    /**
     * 手机验证码登录
     */
    @PostMapping("/smsLogin")
    @ApiOperation("手机验证码登录")
    public R smsLogin(@RequestBody SmsLoginForm form, HttpServletRequest request) {

        //用户登录
        Integer userId = appUserService.smsLogin(form, request);

        //生成token
        String token = jwtUtils.generateToken(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("expire", jwtUtils.getExpire());

        return R.ok(map);
    }

    /**
     * 微信小程序登录
     */
    @PostMapping("/miniWxlogin")
    @ApiOperation("手机验证码登录")
    public R miniWxLogin(@RequestBody WxLoginForm form) {

        //用户登录
        Integer userId = appUserService.miniWxLogin(form);

        //生成token
        String token = jwtUtils.generateToken(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("expire", jwtUtils.getExpire());

        return R.ok(map);
    }


    @Login
    @GetMapping("/userInfo")
    @ApiOperation("获取用户信息")
    public R userInfo(@ApiIgnore @LoginUser AppUserEntity user) {

        AppUserResponse response = appUserService.getUserInfo(user);
        return R.ok().put("result", response);
    }

    @Login
    @PostMapping("/cancelFollow")
    @ApiOperation("取消关注用户")
    public R cancelFollow(@ApiIgnore @LoginUser AppUserEntity user,
                          @RequestBody AddFollowForm request) {
        appUserService.cancelFollow(request, user);
        return R.ok("取消关注用户成功");
    }

    @Login
    @PostMapping("/userInfoEdit")
    @ApiOperation("用户修改个人信息")
    public R userInfoEdit(@ApiIgnore  @LoginUser AppUserEntity user, @RequestBody AppUserUpdateForm appUserUpdateForm) {
        appUserService.updateAppUserInfo(appUserUpdateForm, user);
        return R.ok("修改成功");
    }


    @Login
    @PostMapping("/addFollow")
    @ApiOperation("关注用户")
    public R addFollow(@ApiIgnore  @LoginUser AppUserEntity user, @RequestBody AddFollowForm request) {
        appUserService.addFollow(request, user);
        return R.ok("关注用户成功");
    }




    @Login
    @GetMapping("/userFans")
    @ApiOperation("我的粉丝分页列表")
    public R userFans(@RequestParam("page") Integer page, @ApiIgnore @LoginUser AppUserEntity user) {

        AppPageUtils pages = appUserService.userFans(page, user.getUid());
        return R.ok().put("result", pages);
    }

    @Login
    @GetMapping("/follow")
    @ApiOperation("我的关注分页列表")
    public R follow(@RequestParam("page") Integer page,
                    @ApiIgnore @LoginUser AppUserEntity user) {

        AppPageUtils pages = appUserService.follow(page, user);
        return R.ok().put("result", pages);
    }


    @Login
    @PostMapping("/userInfoById")
    @ApiOperation("用户个人主页信息")
    public R userInfoById(@RequestBody AppUserInfoForm request,
                          @ApiIgnore @LoginUser AppUserEntity user) {
        AppUserInfoResponse response = appUserService.findUserInfoById(request.getUid(), user);

        return R.ok().put("result", response);
    }



    @PostMapping("/userRank")
    @ApiOperation("发帖达人列表")
    public R userRank() {
        List<AppUserRankResponse> list=appUserService.userRank();
        return R.ok().put("result",list);
    }

}
