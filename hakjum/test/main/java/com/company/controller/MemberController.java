package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.MemberDTO;
import com.company.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;

	@GetMapping("/save")
	public String saveForm() {
		return "save";
	}
  
	@PostMapping("/save")
	public String save(@ModelAttribute MemberDTO memberDTO) {
		// 회원 저장
		int saveResult = memberService.save(memberDTO);
    	if(saveResult > 0) {
    		return "login";  // 저장 후 로그인 화면으로 리디렉션
    	} else {
    		return "save";  // 실패하면 다시 저장 화면으로
    	}
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		// 로그인 처리
		boolean loginResult = memberService.login(memberDTO);
		if (loginResult) {
			session.setAttribute("loginHakbun", memberDTO.getBoardHakbun());
			return "main";  // 로그인 성공 후 메인 화면으로
		} else {
			return "login";  // 로그인 실패하면 로그인 화면으로
		}
	}
	
	@GetMapping("/")
	public String findAll(Model model) {
		// 모든 회원 정보 조회
		List<MemberDTO> memberDTOList = memberService.findAll();
		model.addAttribute("memberList", memberDTOList);
		return "list";  // 회원 목록 화면으로
	}
	
	@GetMapping
	public String findById(@RequestParam("id") Long id, Model model) {
		// 특정 회원 정보 조회
		MemberDTO memberDTO = memberService.findById(id);
		model.addAttribute("member", memberDTO);
		return "detail";  // 상세 정보 화면으로
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		// 회원 삭제
		memberService.delete(id);
		return "redirect:/member/";  // 삭제 후 회원 목록 화면으로 리다렉션
	}
	
	@GetMapping("/update")
	public String updateForm(HttpSession session, Model model) {
		// 세션에 저장된 학번을 기반으로 회원 정보 조회
		String loginHakbun = (String) session.getAttribute("loginHakbun");
		MemberDTO memberDTO = memberService.findByMemberHakbun(loginHakbun);
		model.addAttribute("member", memberDTO);
		return "update";  // 업데이트 화면으로
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO memberDTO) {
		// 회원 정보 업데이트
		boolean result = memberService.update(memberDTO);
		if (result) {
			return "redirect:/member?id=" + memberDTO.getId();  // 업데이트 후 상세 화면으로 리디렉션
		} else {
			return "index";  // 실패하면 기본 화면으로
		}
	}
	
	@PostMapping("/Hakbun-check")
	public @ResponseBody String HakbunCheck(@RequestParam("memberHakbun") String memberHakbun) {
		// 학번 중복 체크
		String checkResult = memberService.HakbunCheck(memberHakbun);
		return checkResult;  // "ok" 또는 "no" 반환
	}
	
	@GetMapping("/logout")
	public String logout() {
		// 로그아웃 처리
		return "logout";  // 로그아웃 화면으로
	}
}
