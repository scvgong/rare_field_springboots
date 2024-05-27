package com.yojulab.study_springboot.controller.rarefield.empocommunity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yojulab.study_springboot.service.rarefield.empocommunity.EmpoCommunityService;


@Controller
@RequestMapping("/empo_community")
public class EmpoCommunityWithMap {
    // pagination controller 만들기, select, delete, update

    @Autowired
    EmpoCommunityService empoCommunity;

    @PostMapping("/list_pagination")
    public ModelAndView listPagination(ModelAndView modelAndView
                                    , @RequestParam HashMap<String, Object> dataMap 
                                    , @RequestParam(name = "deleteIds", required = false) ArrayList<String> deleteIds) {

        if ( dataMap.containsKey("btn_type") ) {
            if (dataMap.get("btn_type").equals("delete")){
                dataMap.put("deleteIds", deleteIds);
            }else if (dataMap.get("btn_type").equals("insert")){
                empoCommunity.insert(dataMap);
            }
        }
        Object result = empoCommunity.selectSearchWithPaginationAndDeletes(dataMap);

        String viewPath = "/WEB-INF/rarefield/views/empo/empo_community.jsp";
        modelAndView.setViewName(viewPath);
        modelAndView.addObject("result", result);
        modelAndView.addObject("dataMap", dataMap);
        
        return modelAndView;
    }

    @GetMapping("/selectSearch")
    public ModelAndView selectSearch(@RequestParam HashMap<String, Object> dataMap , ModelAndView modelAndView) {
        
        Object result = empoCommunity.selectSearchWithPagination(dataMap);
        modelAndView.setViewName("/WEB-INF/rarefield/views/empo/empo_community.jsp");
        modelAndView.addObject("dataMap", dataMap);
        modelAndView.addObject("result", result);
        
        
        return modelAndView;
    }


    @GetMapping("/insert") 
    public ModelAndView empoCommunityWrite(ModelAndView modelAndView, @RequestParam HashMap<String, Object> dataMap) {
        Object result = empoCommunity.read(dataMap);

        String viewPath = "/WEB-INF/rarefield/views/empo/empo_community_write.jsp";
        modelAndView.setViewName(viewPath);
        modelAndView.addObject("result", result);
        modelAndView.addObject("dataMap", dataMap);

        return modelAndView;
    } 

    @GetMapping("/read")
    public ModelAndView empoCommunityRead(ModelAndView modelAndView, @RequestParam HashMap<String, Object> dataMap) {
        Object result = empoCommunity.read(dataMap);

        String viewPath = "/WEB-INF/rarefield/views/empo/empo_community_read.jsp";
        modelAndView.setViewName(viewPath);
        modelAndView.addObject("result", result);
        modelAndView.addObject("dataMap", dataMap);

        return modelAndView;
    } 

    @PostMapping("/updateread/{community_ID}")
    public ModelAndView empoCommunityUpdateRead(ModelAndView modelAndView,@PathVariable String community_ID, @RequestParam HashMap<String, Object> dataMap) {
        if ( dataMap.containsKey("btn_type")){
            if (dataMap.get("btn_type").equals("update")){
                empoCommunity.update(dataMap); 
            }
        }
        Object result = empoCommunity.read(dataMap);

        String viewPath = "/WEB-INF/rarefield/views/empo/empo_community_read.jsp";
        modelAndView.setViewName(viewPath);
        modelAndView.addObject("result", result);
        modelAndView.addObject("dataMap", dataMap);

        return modelAndView;
    } 

    @GetMapping("/update")
    public ModelAndView empoCommunityUpdate(ModelAndView modelAndView, @RequestParam HashMap<String, Object> dataMap) {
        Object result = empoCommunity.read(dataMap);

        String viewPath = "/WEB-INF/rarefield/views/empo/empo_community_update.jsp";
        modelAndView.setViewName(viewPath);
        modelAndView.addObject("result", result);
        modelAndView.addObject("dataMap", dataMap);

        return modelAndView;
    } 
   
}
