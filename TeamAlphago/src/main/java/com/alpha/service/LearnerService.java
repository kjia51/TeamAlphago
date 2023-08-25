package com.alpha.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.vo.LearnerVO;
import com.sun.tools.javac.util.List;

@Service
public interface LearnerService {

	public List<LearnerVO> groupList(Model model);
}
