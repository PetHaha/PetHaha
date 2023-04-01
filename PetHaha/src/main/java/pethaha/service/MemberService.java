package pethaha.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IMemberDao;

@Service
public class MemberService {
	
	@Autowired
	IMemberDao mdao;

	public void PgetMember(HashMap<String, Object> prm) {
		mdao.PgetMember(prm);		
	}

	public void PmemberUpdate(HashMap<String, Object> prm) {
		mdao.PmemberUpdate(prm);
		
	}

}
