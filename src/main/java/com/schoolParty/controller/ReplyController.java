package com.schoolParty.controller;
import com.schoolParty.model.*;
import com.schoolParty.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {
    @Resource
    private IReplyService replyService;
    @Resource
    private IPostService postService;
    @Resource
    private PlateService plateService;
    @Resource
    private IUserService userService;
    @Resource
    private IExpressUserService expressUserService;
    @RequestMapping(value = "/selectAllReply")
    public String selectAllReply(HttpServletRequest request,String idpost, String idplate, Model model, int pageNum)
    {

        pageBean<replyshow> pg = replyService.selectAllReply(idpost,pageNum);
        post Post = postService.selectOnePost(idpost);
        User user = userService.selectUser(String.valueOf(Post.getUserId()));
        postshow postshow = new postshow(Post.getTitle(),user.getNickname(),Post.getPublishTime(),
                Post.getType(),user.getImg(),String.valueOf(Post.getIdpost()),Post.getContent(),Post.getKdcode(),
                Post.getKdphone(),Post.getKdcompany(),Post.getKdname());
        plate Plate = plateService.selectOne(idplate);
        User curuser = (User)request.getSession().getAttribute("user");
        if (curuser!=null)
        {
            boolean hasrelation = expressUserService.hasrelation(curuser.getUid(),Integer.parseInt(idpost));
            model.addAttribute("hasrelation",hasrelation);
        }
        model.addAttribute("reply",pg);
        model.addAttribute("post",postshow);
        model.addAttribute("plate",Plate);
        if(idplate.equals("2"))
        {
            return "expresspost";
        }
        else
            return "post";
    }
    @RequestMapping("/insertReply")
    public String insertReply(String ruserid ,String replyforid,String content,String idplate)
    {
        Date date = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        replyService.insertReply(ruserid,replyforid,content,f.format(date));
        return "redirect:/reply/selectAllReply?idpost="+replyforid+"&idplate="+idplate+"&pageNum=1";
    }
    @RequestMapping("/deleteReply")
    public String deleteReply(String replyforid,int rid,String idplate)
    {
        replyService.deleteReply(rid);
        return "redirect:/reply/selectAllReply?idpost="+replyforid+"&idplate="+idplate+"&pageNum=1";
    }

}
