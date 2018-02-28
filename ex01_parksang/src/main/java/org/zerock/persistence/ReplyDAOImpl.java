package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> list(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list",id);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create",vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer num) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",num);
	}

	@Override
	public List<ReplyVO> listPage(Integer id, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> paramMap = new HashMap<>();
		
		paramMap.put("id", id);
		paramMap.put("cri", cri);
		return session.selectList(namespace+".listPage",paramMap);
	}

	@Override
	public int count(Integer id) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectOne(namespace+".count",id);
	}

}
