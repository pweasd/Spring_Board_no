package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}

	@Override
	public List<ReplyVO> listReply(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(id);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void removeReply(Integer num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer id, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(id, cri);
	}

	@Override
	public int count(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(id);
	}

}
