package com.company.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
    private Long id;            // 테이블의 id 
    private String boardID;
    private String boardPass;
    private String boardHakbun;
    private String boardName;
    private int boardKo;
    private int boardEg;
    private int boardMath;
    
}