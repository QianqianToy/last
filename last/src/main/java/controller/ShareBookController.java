package controller;

import domain.ShareBook;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.ShareBookService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2017/7/15 0015.
 */
@Controller
public class ShareBookController {

    @Autowired
    private ShareBookService shareBookService;

    @Autowired
    private UserService userService;

    @RequestMapping("/selectShareByUserID")
    public String selectShareByUserID(ModelMap modelMap,Integer userID){//收获共享

        User user = userService.findById(userID);
        modelMap.addAttribute("user",user);

        List<ShareBook> list = shareBookService.findShareByUserID(userID);
        modelMap.addAttribute("Share",list);

        return "sharebook.jsp";
    }

    @ResponseBody
    @RequestMapping("/insertByUserID")
    public ShareBook insertByUserID(ShareBook shareBook, HttpServletRequest request, @RequestParam("file") MultipartFile files,Integer userID){

        shareBook.setPicture(files.getOriginalFilename());
        File file1 = new File(request.getServletContext().getRealPath("/")+files.getOriginalFilename());
        try {
            files.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }

        shareBookService.addByUserID(shareBook);
        List<ShareBook> list = shareBookService.findMyShareByUserID(userID);

        return list.get(0);
    }

    @ResponseBody
    @RequestMapping("/selectMyShareByUserID")
    public List<ShareBook> selectMyShareByUserID(ModelMap modelMap,Integer userID){

        List<ShareBook> list = shareBookService.findMyShareByUserID(userID);
        return list;
    }
}
