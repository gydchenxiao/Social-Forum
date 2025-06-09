//
package io.college.modules.app.controller;


import io.college.common.utils.AppPageUtils;
import io.college.common.utils.R;
import io.college.modules.admin.entity.AppUserEntity;
import io.college.modules.admin.service.CommentService;
import io.college.modules.app.annotation.Login;
import io.college.modules.app.annotation.LoginUser;
import io.college.modules.app.param.AddThumbsForm;
import io.college.modules.app.service.CommentThumbsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

/**
 *
 * @author college
 * @date 2022/7/27 15:35
 *
 */
@Api(tags = "用户端——评论")
@RestController
@RequestMapping("app/comment")
public class AppCommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private CommentThumbsService commentThumbsService;

    /**
     * 评论列表
     */
    @GetMapping("/list")
    @ApiOperation("评论列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "postId", value = "帖子id", paramType = "query",dataType = "Integer", required = true),
            @ApiImplicitParam(name = "page", value = "分页页码",paramType = "query", dataType = "Integer", required = true)
    })
    public R list(@RequestParam("postId")Integer postId,
                  @RequestParam("page")Integer page){
        AppPageUtils pages =commentService.queryCommentPage(postId,page);

        return R.ok().put("result", pages);
    }


    /**
     * 评论区的点赞
     */
    @Login
    @PostMapping("/thumbs")
    @ApiOperation("评论区的点赞")
    public R thumbs(@RequestBody AddThumbsForm request,
                    @ApiIgnore @LoginUser AppUserEntity user){

        commentThumbsService.addThumbs(request,user);
        return R.ok();
    }

    /**
     * 取消评论区的点赞
     */
    @Login
    @PostMapping("/cancelThumbs")
    @ApiOperation("取消评论区的点赞")
    public R cancelThumbs(@RequestBody AddThumbsForm request,
                          @ApiIgnore @LoginUser AppUserEntity user){

        commentThumbsService.cancelThumbs(request,user);
        return R.ok();
    }
}
