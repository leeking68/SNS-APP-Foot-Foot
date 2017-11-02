package work.com.byebye.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.com.byebye.dto.BeaconDto;
import work.com.byebye.service.BeaconService;

@Controller
public class BeaconController {
     
    @Resource(name="beaconService")
    private BeaconService beaconService;
     
    @RequestMapping(value = "beaconlist.do")
    public ModelAndView getBeaconList() {
        List<BeaconDto> list = beaconService.getBeaconList();
        ModelAndView mv = new ModelAndView();
        if(list != null) {
        	list = null;
        	mv.addObject("list", list);
        	mv.setViewName("beacon/beaconList");
        } else {
        	mv.addObject("message", "Error go back to the Back page.");
        	mv.setViewName("error/errorPage");
        }
        return mv;
    }
    
    @RequestMapping(value = "beacon.do")
    public ModelAndView getBeacon(String BId) {
        BeaconDto vo = beaconService.getBeacon(BId);
        ModelAndView mv = new ModelAndView("redirect:/beacon.do");
        mv.addObject("vo", vo);
        
        return mv;
    }
    
    
    @RequestMapping(value = "listResult.do", method=RequestMethod.GET)
	public ModelAndView getResult(String mac) {
		
		JSONParser parser = new JSONParser();
		ArrayList<String> macList = new ArrayList<String>();
		try {
			JSONObject obj = (JSONObject) parser.parse(mac);
			JSONArray array = (JSONArray) obj.get("mac");
			@SuppressWarnings("unchecked")
			Iterator<String> iterator = array.iterator();
			while(iterator.hasNext()){
				macList.add(iterator.next());
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(macList);
		List<BeaconDto> list = beaconService.getBeaconResult(macList);
		ModelAndView mv = new ModelAndView();
		if(list != null) {
	        mv.addObject("list", list);
	        mv.setViewName("beacon/beaconList");
		} else {
        	mv.addObject("message", list);
        	mv.setViewName("error/errorPage");
        }
        return mv;
    }
}

