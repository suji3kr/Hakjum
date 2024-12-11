package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.dto.MemberDTO;
import com.company.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
    
    private final MemberRepository memberRepository;

    // save 메소드 - MemberDTO를 받아서 저장
    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }

    // login 메소드 - 로그인 인증
    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO);
        return loginMember != null;  // 로그인 성공 시 true 반환
    }

    // findAll 메소드 - 전체 회원 조회
    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    // findById 메소드 - id로 회원 정보 조회
    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    // delete 메소드 - id로 회원 삭제
    public void delete(Long id) {
        memberRepository.delete(id);
    }

    // findByMemberHakbun 메소드 - 학번으로 회원 정보 조회
    public MemberDTO findByMemberHakbun(String loginHakbun) {
        return memberRepository.findByMemberHakbun(loginHakbun);
    }

    // update 메소드 - 회원 정보 수정
    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        return result > 0;  // 업데이트 성공 시 true 반환
    }

    // hakbunCheck 메소드 - 학번 중복 검사
    public String HakbunCheck(String memberHakbun) {
        MemberDTO memberDTO = memberRepository.findByMemberHakbun(memberHakbun);
        return memberDTO == null ? "ok" : "no";  // 학번이 없으면 "ok", 있으면 "no"
    }

	
}
