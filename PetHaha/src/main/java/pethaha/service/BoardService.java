package pethaha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IBoardDao;

@Service
public class BoardService {
	
	@Autowired
	IBoardDao bdao;

}
