package pethaha.service;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IBoardDao2;

@Service
public class BoardService2 {
	
	@Autowired
	IBoardDao2 bdao;

	public void PboardView(HashMap<String, Object> prm) {
		bdao.PboardView(prm);
		
	}
}
