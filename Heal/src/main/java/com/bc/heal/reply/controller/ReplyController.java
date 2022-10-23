package com.bc.heal.reply.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bc.heal.reply.service.ReplyService;
import com.bc.heal.vo.Member;
import com.bc.heal.vo.PageInfo;
import com.bc.heal.vo.Reply;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService service;
	

	@GetMapping("/delete")
	public String delete(Model model, int no, HttpServletRequest req) {
		int result = 0;
		
		result = service.delete(no);
		String location = req.getHeader("Referer");
		
		if(result > 0) {
			model.addAttribute("msg", "삭제에 성공하셨습니다.");
			model.addAttribute("location", location);
		} else {
			model.addAttribute("msg", "삭제에 실패하셨습니다.");
			model.addAttribute("location", location);
		}
		
		return "common/msg";
	}
	
	@GetMapping("/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam Map<String, String> param) {
		List<Reply> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		int page = 1;
		if(param.containsKey("page")) {
			page = Integer.parseInt(param.get("page"));
		}
		String photo = param.get("photo");
		PageInfo pageInfo = new PageInfo(page, 5, service.getCount(Integer.parseInt(photo)), 12);
		
		list = service.selectListByPhoto(page, pageInfo);
		
		map.put("list", list);
		map.put("pageInfo", pageInfo);
		return map;
	}
	
	@PostMapping("/write")
	public String write(Model model, @ModelAttribute Reply reply, @Param("title") String title,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		reply.setMemberno(loginMember.getNo());
		reply.setTitle(title);
		service.save(reply);
		String no = ""+reply.getPhotono();
		
		return "redirect: /photo/view?no="+no;
	}
}
