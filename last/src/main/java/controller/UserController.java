package controller;

import domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.ArticleService;
import service.ShareBookService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * TODO()
 * Created by zqq on 2017/7/11 0011.
 */
@Controller
public class UserController extends TotalController{

    @Autowired
    private UserService userService;

    @Autowired
    private ShareBookService shareBookService;

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/viewAuthor")//个人详情页
    public String viewAuthor(ModelMap modelMap, String username, Integer userlog){

        List<ShareBook> myShareBooks = shareBookService.myShare(username);
        modelMap.addAttribute("myShareBooks",myShareBooks);//作者页面共享书籍

        author(modelMap,username,userlog);

        modelMap.addAttribute("userlog",userlog);

        return "author.jsp";
    }

    @RequestMapping("/login")//登录
    public String login(String username, String password, ModelMap modelMap, HttpSession session){

        User user =userService.findByUser(username,password);

        if(user !=null){
            modelMap.addAttribute("user",user);
            modelMap.addAttribute("username",username);
            session.setAttribute("username",username);
            session.setAttribute("loginuser",user);
            TimeArticle(modelMap);//加载主页前查找到实时文章

            readMoreArticle(modelMap);//阅读更多

            List<ArticleAndIcon> upArticles = articleService.loginUpArticle(user.getUserID());//查找登录后的猜你喜欢
            if(upArticles==null){
                upArticle(modelMap);//加载主页前查找到猜你喜欢
            }else {
                modelMap.addAttribute("upArticles", upArticles);
            }

            downArticle(modelMap);//加载主页前查找到0分作文

            IndexAuthor(modelMap);//主页作者

            return "index.jsp";
        }
        return "regist.jsp";
    }

    @RequestMapping("/register")//注册
    public String insertUser(User user,ModelMap modelMap){
        System.out.println("注册跳转");
        int result=userService.insertUser(user);
        if(result != 0){
            return "index.jsp";
        }
        return "regist.jsp";
    }

    @RequestMapping("/selectById")//从主页跳转个人中心
    public String selectById(Integer userID, ModelMap modelMap){

        User user=userService.findById(userID);
        modelMap.addAttribute("user",user);
        return "introduce.jsp";
    }

    @RequestMapping("/updateAllById")//个人中心完善信息
    public String updateAllById(User user, HttpServletRequest request, @RequestParam("file") MultipartFile files){
        if(files.getSize()!=0) {
            String[] str=files.getOriginalFilename().split("\\.");
            String newfilename=str[0]+user.getUserID()+"."+str[1];
            user.setPhoto(newfilename);
            File file1 = new File(request.getServletContext().getRealPath("/")+"images/" + newfilename);
            try {
                files.transferTo(file1);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            User user1=userService.findById(user.getUserID());
            user.setPhoto(user1.getPhoto());
        }
        userService.updateAllById(user);
        return "introduce.jsp";
    }

    @RequestMapping("/article")//写文章功能，获取文章内容
    public String insertArticle(Article article, ModelMap map){
        System.out.println("进入后台成功");
        int result=userService.insertArticle(article);
        System.out.println("获取到数据");
        if(result != 0){
            map.addAttribute("article",article);
            return "time.jsp";
        }
        return "writearticle.jsp";
    }

    @RequestMapping("/drafts")//把文章存入草稿箱
    public String insertToDrafts(Article article, ModelMap map){
        System.out.println("进入草稿箱控制部分");
        int result=userService.insertToDrafts(article);
        System.out.println("获取到数据2");
        if(result!=0){
            map.addAttribute("article",article);
            return "time.jsp";
        }
        return "writearticle.jsp";
    }

    @RequestMapping("/share")//共享文章页面模糊查询
    public String getFind(String ename,ModelMap map){
        System.out.println("进入模糊查询控制器");
        List<ShareBook> shareBooks=userService.getSelectAll(ename);
        if(shareBooks!=null){
        map.addAttribute("shareBooks",shareBooks.get(0));
        }
        return "share.jsp";
    }

    //查找文章数据
    @RequestMapping("/findAricleData")
    @ResponseBody
    public Describe findAricleData(String username,Integer articleID/*需传值*/, HttpSession session,ModelMap modelMap){
        //查询用户账号数据
        modelMap.addAttribute("username",username);
        modelMap.addAttribute("articleID",articleID);
        User user =userService.findUser(username);
        session.setAttribute("user",user);
        //查询文章数据
        Article article= userService.findArticle(articleID);
        session.setAttribute("article",article);
        //查询评论数量
        List commentList=userService.findCommentNum(articleID);
        int num=commentList.size();
        //数据全部加入Describe对象
        Describe describe=new Describe();
        describe.setArticle(article);
        describe.setCommentNum(num);
        describe.setUser(user);
        Date date=article.getWriteTime();
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        describe.setTimeWrite(time);
        return describe;
    }

    @RequestMapping("/goArticleUI")
    public String goArticleUI(String username,Integer articleID,HttpServletRequest request){
        request.setAttribute("username",username);
        request.setAttribute("articleID",articleID);
        return "describe.jsp";
    }

    //投诉
    @RequestMapping("/complain")
    @ResponseBody
    public Describe complainResult(String autor, String complainArticle, String complainReason )throws Exception{
        Describe describe =new Describe();
        describe.setComplainContent(complainReason);
        describe.setUserID(userService.selectID(autor));
        describe.setComplainArticle(complainArticle);
        Date now = new Date();

        describe.setComplainDate(now);
        if (userService.findComplainResult(describe)!=1){
            return null;
        }
        describe.setResult("1");
        return describe;

    }
    //判断是否点过赞或踩
    @RequestMapping("/vote")
    @ResponseBody
    public Describe findZanOrNo(String articleID,String zanState,HttpServletRequest request){

        int userID=-1;
        User user= (User) request.getSession().getAttribute("loginuser");
        if(user==null){
            return null;
        }
        userID=user.getUserID();
        //判断表有么有数据，没有插入一行
        if (userService.exisitService(Integer.parseInt(articleID),userID)==null){
            userService.zan1( userID,"无",Integer.parseInt(articleID));
        }
        //修改赞、踩状态
        Describe describe=new Describe();
        Article article= null;
        String state=userService.selectZanOrNo(Integer.parseInt(articleID),userID);

        if (state.equals("无")){
            if (zanState.equals("踩")){
                userService.updateZanService(zanState,Integer.parseInt(articleID),userID);
                describe.setResult("踩成功");
                userService.updateZanNum1(Integer.parseInt(articleID),Integer.parseInt(articleID));
                article=userService.findArticle(Integer.parseInt(articleID));
                describe.setArticle(article);
                return describe;
            }
            userService.updateZanService(zanState,Integer.parseInt(articleID),userID);
            describe.setResult("赞成功");
            userService.updateZanNum1(Integer.parseInt(articleID),Integer.parseInt(articleID));
            article=userService.findArticle(Integer.parseInt(articleID));
            describe.setArticle(article);
            return describe;
        } else if (state.equals("赞")){
            if (zanState.equals("踩")){
                describe.setResult("已赞,无法再踩！");
                article=userService.findArticle(Integer.parseInt(articleID));
                describe.setArticle(article);
                return describe;
            }else {
                userService.updateZanService("无",Integer.parseInt(articleID),userID);
                describe.setResult("取消赞成功！");
                userService.updateZanNum1(Integer.parseInt(articleID),Integer.parseInt(articleID));
                article=userService.findArticle(Integer.parseInt(articleID));
                describe.setArticle(article);
                return describe;
            }
        }else {
            if (zanState.equals("踩")){
                userService.updateZanService("无",Integer.parseInt(articleID),userID);
                describe.setResult("取消踩成功！");
                userService.updateZanNum1(Integer.parseInt(articleID),Integer.parseInt(articleID));
                article=userService.findArticle(Integer.parseInt(articleID));
                describe.setArticle(article);
                return describe;
            }
            article=userService.findArticle(Integer.parseInt(articleID));
            describe.setArticle(article);
            describe.setResult("已踩，无法再赞！");
            return describe;
        }

    }

    //加载评论
    @RequestMapping("/userComments")
    @ResponseBody
    public List<Comment>  selectCommentController(int articleID){

        List<Comment>  list=userService.selectCommentService(articleID);
        System.out.println("jiazai");
        return list;
    }

    //打赏功能
    @RequestMapping("/flower")
    @ResponseBody
    public Describe daShang(String articleID,String username,String flowerNum,String authorName){
        Describe describe=new Describe();
        Trade trade=new Trade();
        System.out.println(1);
        int num=userService.selectFlowerNum(username);
        System.out.println(2);
        if (Integer.parseInt(flowerNum)>num){
            System.out.println(3);
            describe.setResult("您的红花数量不足，请尽快充值。。。");
            return describe;
        }
        System.out.println(4);
        int userID=userService.selectID(username);
        Date date=new Date();
        trade.setTradeTime(date);
        trade.setUserID(userID);
        trade.setArticleID(Integer.parseInt(articleID));
        trade.setAuthorID(userService.selectID(authorName));
        System.out.println(5);
        trade.setTradeFlowers(Integer.parseInt(flowerNum));
        userService.recordInsert(trade);
        System.out.println(6);
        //更新作者红花
        int flowerNumNow =Integer.parseInt(flowerNum)+userService.selectFlowerNum(authorName);
        System.out.println(flowerNumNow);
        userService.updateFlower(flowerNumNow,authorName);
        System.out.println(7);
        //更新用户红花
        int flowerUser=userService.selectFlowerNum(username)-Integer.parseInt(flowerNum);

        userService.updateFlower(flowerUser,username);
        System.out.println(8);

        describe.setResult("打赏成功。。。。。");
        return describe;
    }

    //评论
    @RequestMapping("/insertComment")
    @ResponseBody
    public int comment(int articleID,String comment,String username ){
        Comment comments=new Comment();
        comments.setComment(comment);
        comments.setUserID(userService.selectID(username));
        comments.setFloor(userService.findCommentNum(articleID).size()+1);
        comments.setCommentDate(new Date());
        comments.setArticleID(articleID);
        comments.setUpNum(0);
        comments.setPhoto(userService.findUser(username).getPhoto());
        comments.setUsername(username);
        System.out.println(comment);
        if (userService.InsertCommentService(comments)!=1){
            return 0;
        }
        return 1;
    }

    //评论点赞
    @RequestMapping("/zan1")
    @ResponseBody
    public Comment  commentVote(int authorID,int commentID ,int userID){
        CommentVote commentVote=new CommentVote();
        Comment comment=new Comment();
        String state=userService.exsitVote(commentID,authorID);
        if (state==null){
            commentVote.setCommentID(commentID);
            commentVote.setUserID(authorID);
            commentVote.setState("赞");
            userService.insertCommentVote(commentVote);
            comment.setUpNum(1+userService.selectCommentVote(commentID));
            userService.updateCommentNum(1+userService.selectCommentVote(commentID),commentID);
            return comment;
        }
        if (state.equals("赞")){
            userService.updateCommentPosition("无",commentID,userID);
            comment.setUpNum(userService.selectCommentVote(commentID)-1);
            userService.updateCommentNum(userService.selectCommentVote(commentID)-1,commentID);
            return comment;
        }else if (state.equals("无")){
            userService.updateCommentPosition("赞",commentID,userID);
            comment.setUpNum(1+userService.selectCommentVote(commentID));
            userService.updateCommentNum(1+userService.selectCommentVote(commentID),commentID);
            return comment;
        }else {
            return comment ;
        }
    }

    //评论回复
    @RequestMapping("/reply")
    @ResponseBody
    public Reply insertReply(String commentsReply, int commentId, int userID){
        Reply reply =new Reply();
        Describe describe=new Describe();
        reply.setReply(commentsReply);
        reply.setUserID(userID);
        reply.setCommentID(commentId);
        reply.setDate(new Date());

        if (userService.insertReply(reply)!=0){
            return reply;
        }
        return null;
    }
}
