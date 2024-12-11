package com.company.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberRepository {
    
    private final SqlSessionTemplate sql;
    
    public List<MemberDTO> findAll() {
        return sql.selectList("Hakjum.findAll");
    }

    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        return sql.insert("Hakjum.save", memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Hakjum.login", memberDTO);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Hakjum.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Hakjum.delete", id);
    }

    public MemberDTO findByMemberHakbun(String loginHakbun) {
        return sql.selectOne("Hakjum.findByMemberHakbun", loginHakbun);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Hakjum.update", memberDTO);
    }

	
}
