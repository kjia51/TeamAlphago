package com.alpha.vo;

import lombok.Data;

@Data
public class QnAVO {

	// question
	private String q_no;
	private String q_m_id;
	private String q_title;
	private String q_content;
	private String q_regdate;
	private String q_answerYN;
	
	// answer
	private String a_no;
	private String a_m_id;
	private String a_q_id;
	private String a_title;
	private String a_content;
	private String a_regdate;
	
}
