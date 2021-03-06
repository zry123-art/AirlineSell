package airline.controller;

import airline.bean.*;
import airline.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AirController {
    @Autowired
    @Qualifier("adminService")
    private IAdminService adminService;
    @Autowired
    @Qualifier("airlinecompanyService")
    private IAirlinecompanyService airlinecompanyService;
    @Autowired
    @Qualifier("airplanetypeService")
    private IAirplanetypeService airplanetypeService;
    @Autowired
    @Qualifier("flightinfoService")
    private IFlightinfoService flightinfoService;

    @Autowired
    @Qualifier("userinfoService")
    private IUserinfoService userinfoService;

    public IUserinfoService getUserinfoService() {
        return userinfoService;
    }

    public void setUserinfoService(IUserinfoService userinfoService) {
        this.userinfoService = userinfoService;
    }

    public AirController(IAdminService adminService, IAirlinecompanyService airlinecompanyService, IAirplanetypeService airplaneService, IFlightinfoService flightinfoService) {
        this.adminService = adminService;
        this.airlinecompanyService = airlinecompanyService;
        this.airplanetypeService = airplaneService;
        this.flightinfoService= flightinfoService;
    }

    @RequestMapping("/index.do")
    public String indes(){
        return "/index.jsp";
    }

    /******************************机型操作***************************************/
    /*添加机型信息*/
    @RequestMapping("/jumpAddAp.do")
    public String jumpAddAp(){
        return "/WEB-INF/airline/addAirplanetype.jsp";
    }
    @RequestMapping("/addAirplanetype.do")
    public String addAirplanetype(Airplanetype airplanetype){
        if (airplanetypeService.addAirplanetype(airplanetype))
            return "redirect:selectAllAirplanetype.do";
        else
            return "/WEB-INF/airline/fail.jsp";
    }

    /* 根据机型名删除机型信息*/
    @RequestMapping("/deleteAirplanetype.do")
    public String jumpAirplanetype(String name){
        if (airplanetypeService.moveAirplanetypeByName(name))
            return "redirect:selectAllAirplanetype.do";
        else
            return "/WEB-INF/airline/fail.jsp";
    }

    /*修改机型信息*/
    @RequestMapping("/jumpAlterAp.do")
    public String jumpAlterAp(){ return "/WEB-INF/airline/alterAirplanetype.jsp"; }
    @RequestMapping("/alterAirplanetype.do")
    public String alterAirplanetype(Airplanetype airplanetype){
       if(airplanetypeService.alterAirplanetype(airplanetype))
           return "redirect:selectAllAirplanetype.do";
       else
           return "/WEB-INF/airline/fail.jsp";
    }

    /*查询所有机型*/
    @RequestMapping("/jumpListAa.do")
    public String jumpListAa(){ return "/WEB-INF/airline/listAirplanetype.jsp"; }
    @RequestMapping("/selectAllAirplanetype.do")
    public String doSelectAllAirplanetype(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        int pageSize = 1000;
        PageHelper.startPage(pn, pageSize);
        List<Airplanetype> airplanetypes = airplanetypeService.findAllAirplanetype();
        PageInfo page = new PageInfo(airplanetypes, pageSize);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/airline/listAirplanetype.jsp";
    }

    /*根据机型名查询机型*/
    @RequestMapping("/jumpListAPbyN.do")
    public String jumpListAPbyN(){ return "/WEB-INF/airline/listAirplanetype.jsp"; }
    @RequestMapping("/selectAirplanetypeByName.do")
    public String doSelectAirplanetypeByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, String name) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Airplanetype> airplanetypes = airplanetypeService.findAirplanetypeByName(name);
        PageInfo page = new PageInfo(airplanetypes, 5);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/airline/listAirplanetype.jsp";
    }


    /******************************航空公司操作***************************************/
    /*添加航空公司信息*/
    @RequestMapping("/jumpAddAl.do")
    public String jumpAddAl(){ return "/WEB-INF/airline/addAirlinecompany.jsp"; }
    @RequestMapping("/addAirlinecompany.do")
    public String addAirlinecompany(Airlinecompany airlinecompany) {
        if (airlinecompanyService.addAirlinecompany(airlinecompany))
            return "redirect:selectAllAirlinecompany.do";
        else
            return "/WEB-INF/airline/fail.jsp";
    }

     /*根据公司名删除公司信息*/
    @RequestMapping("/deleteAirlinecompany.do")
    public String jumpAirlinecompany(String name){
        if (airlinecompanyService.moveAirlinecompanyByName(name))
            return "redirect:selectAllAirlinecompany.do";
        else
            return "/WEB-INF/airline/fail.jsp";
    }

   /* 修改公司信息*/
    @RequestMapping("/jumpAlterAl.do")
    public String jumpAlterAl(){ return "/WEB-INF/airline/alterAirlinecompany.jsp"; }
    @RequestMapping("/alterAirlinecompany.do")
    public String alterAirlinecompany(Airlinecompany airlinecompany){
        if (airlinecompanyService.alterAirlinecompany(airlinecompany))
            return "redirect:selectAllAirlinecompany.do";
        else
            return "/WEB-INF/airline/fail.jsp";
    }

   /* 查询所有公司*/
    @RequestMapping("/jumpListAc.do")
    public String jumpListAc(){ return "/WEB-INF/airline/listAirlinecompany.jsp"; }
    @RequestMapping("/selectAllAirlinecompany.do")
    public String doSelectAllAirlinecompany(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        int pageSize = 1000;
        PageHelper.startPage(pn, pageSize);
        List<Airlinecompany> airlinecompanies = airlinecompanyService.findAllAirlinecompany();
        PageInfo page = new PageInfo(airlinecompanies, pageSize);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/airline/listAirlinecompany.jsp";
    }

    /*根据公司名查询公司*/
    @RequestMapping("/jumpListACbyN.do")
    public String jumpListACbyN(){ return "/WEB-INF/airline/listAirlinecompany.jsp"; }
    @RequestMapping("/selectAirlinecompanyByName.do")
    public String doSelectAirlinecompanyByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, String name) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Airlinecompany> airlinecompanies = airlinecompanyService.findAirlinecompanyByName(name);
        PageInfo page = new PageInfo(airlinecompanies, 5);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/airline/listAirlinecompany.jsp";
    }

    /******************************航班操作***************************************/
    /*添加航班信息*/
    @RequestMapping("/jumpAddFl.do")
    public String jumpAddFl(){
        return "/WEB-INF/airline/addFlight.jsp";
    }
    @RequestMapping("/addFlight.do")
    public String addFlightinfo(Flightinfo flightinfo){
        if (flightinfoService.addFightinfo(flightinfo))
            return "redirect:selectAllFlightinfo.do";
        else
            return "/WEB-INF/airline/addFlight.jsp";
    }

    /* 根据航班号删除航班信息*/
    @RequestMapping("/deleteFlight.do")
    public String jumpFightinfo(String flightnumber){
        if (flightinfoService.moveFightinfo(flightnumber))
            return "redirect:selectAllFlightinfo.do";
        else
            return "/WEB-INF/airline/fail.jsp";
    }

    /*管理员查询所有航班*/
    @RequestMapping("/jumpListAf.do")
    public String jumpListAf(){
        return "redirect:selectAllFlightinfo.do";
    }
    @RequestMapping("/selectAllFlightinfo.do")
    public String doSelectAllFlight(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, HttpServletRequest request) {
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        int pageSize = 1000;
        PageHelper.startPage(pn, pageSize);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Flightinfo> flightinfos = flightinfoService.findAllFlightinfo();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(flightinfos, pageSize);
        model.addAttribute("pageInfo", page);
        //尝试做公司与型号的实时下拉框
        List<Airlinecompany> companies = airlinecompanyService.findAllAirlinecompany();
        PageInfo companypage = new PageInfo(companies, pageSize);
        model.addAttribute("pageForCompany", companypage);
        List<Airplanetype> types = airplanetypeService.findAllAirplanetype();
        PageInfo typepage = new PageInfo(types, pageSize);
        model.addAttribute("pageForType", typepage);
        //尝试解决乘车人信息实时下拉框，失败
        /*HttpSession usersession =request.getSession();
        User user = (User) usersession.getAttribute("user");
        List<Userinfo> userinfos = userinfoService.findAllUserinfo(user.getAccountname());
        PageInfo userinfopage = new PageInfo(userinfos, pageSize);
        model.addAttribute("pageForUserinfo", userinfopage);*/
        //强行产生冗余代码弥补技术不足，失败
//        PageInfo userinfopage2 = new PageInfo(userinfos, pageSize);
//        model.addAttribute("pageForUserinfo2", userinfopage2);
//        PageInfo userinfopage3 = new PageInfo(userinfos, pageSize);
//        model.addAttribute("pageForUserinfo3", userinfopage3);
        HttpSession session =request.getSession();
        if (session.getAttribute("admin")!=null) {
            return "/WEB-INF/airline/listFlightinfo.jsp";
        }
        return "/WEB-INF/airline/fail.jsp";
    }

    /*用户查询所有航班*/
    @RequestMapping("/jumpListAfFU.do")
    public String jumpListAfFU(){
        return "redirect:selectAllFlightinfoFU.do";
    }
    @RequestMapping("/selectAllFlightinfoFU.do")
    public String doSelectAllFlightFU(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Flightinfo> flightinfos = flightinfoService.findAllFlightinfo();
        PageInfo page = new PageInfo(flightinfos, pageSize);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/airline/listFlightinfoForUser.jsp";
    }




    /*根据公司名查询航班*/
    @RequestMapping("/jumpListFbyN.do")
    public String jumpListFbyN(){ return "/WEB-INF/airline/listFlightinfo.jsp"; }
    @RequestMapping("/selectFlightinfoByAirlinecompanyName.do")
    public String doSelectFlightinfoByAirlinecompanyName(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, String airlinecompany_name){
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Flightinfo> flightinfos = flightinfoService.findFlightinfoByAirlinecompanyName(airlinecompany_name);
        PageInfo page = new PageInfo(flightinfos, 5);
        model.addAttribute("pageInfo", page);
        return "/WEB-INF/airline/listFlightinfo.jsp";
    }

    /*根据其他信息查询航班*/
    @RequestMapping("/jumpListFbyO.do")
    public String jumpListFbyO(){ return "redirect:SelectFlightinfoByOther.do"; }
    @RequestMapping("/SelectFlightinfoByOther.do")
    public String doSelectFlightinfoByOther(@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletRequest request, Model model,String start,String end,String starttime,String endtime){
        start=request.getParameter("start");
        end=request.getParameter("end");
        starttime=request.getParameter("starttime");
        endtime=request.getParameter("endtime");
        int pageSize = 5;
        if (flightinfoService.findFlightinfoByOther(start,end,starttime,endtime)!=null){
            PageHelper.startPage(pn, pageSize);
            List<Flightinfo> flightinfos = flightinfoService.findFlightinfoByOther(start,end,starttime,endtime);
            PageInfo page = new PageInfo(flightinfos, 5);
            model.addAttribute("pageInfo", page);
            return "/WEB-INF/airline/listFlightinfoForUser.jsp";
        }if (flightinfoService.findFlightinfoByOther(start,end,starttime,endtime)==null){
            model.addAttribute("msg", "没有找到指定航班信息，请放宽查询条件");
            return "/WEB-INF/error/noData.jsp";
        }
        return "/WEB-INF/airline/fail.jsp";
    }

    /* 根据机型删除航班信息*/
//    @RequestMapping("/deleteFlight1.do")
//    public String jumpFightinfo1(String airplanetype_name){
//        if (flightinfoService.moveFightinfo1(airplanetype_name))
//            return "redirect:selectAllFlightinfo.do";
//        else
//            return "/WEB-INF/airline/fail.jsp";
//    }
//    /* 根据公司删除航班信息*/
//    @RequestMapping("/deleteFlight2.do")
//    public String jumpFightinfo2(String airlinecompany_name){
//        if (flightinfoService.moveFightinfo2(airlinecompany_name))
//            return "redirect:selectAllFlightinfo.do";
//        else
//            return "/WEB-INF/airline/fail.jsp";
//    }


}
