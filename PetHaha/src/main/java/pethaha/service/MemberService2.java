package pethaha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IMemberDao2;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;
}
