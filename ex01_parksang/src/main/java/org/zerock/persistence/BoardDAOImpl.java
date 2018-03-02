package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.HibernateUtil;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace
	="org.zerock.mapper.BoardMapper";
	
	@Override
	public void create(BoardVO vo) throws Exception {
		 Session sessions = HibernateUtil.getSessionFactory().openSession();
		 Transaction tx = sessions.beginTransaction();
		 sessions.persist(vo);
		
		//session.insert(namespace+".create",vo);
		 tx.commit();
		 sessions.close();
	}

	@Override
	public BoardVO read(Integer id) throws Exception {
	
		return session.selectOne(namespace+".read",id);
	}

	@Override
	public void update(BoardVO vo) throws Exception {

		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer id) throws Exception {
	
		session.delete(namespace+".delete",id);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {

		return session.selectList(namespace+".listAll");
	}
	
	@Override
	public void updateview(Integer id)throws Exception{
		
		session.update(namespace+".updateview",id);
	}

//	@Override
//	public List<BoardVO> listPage(int page) throws Exception {
//		// TODO Auto-generated method stub
//		if (page <= 0) {
//			page= 1;
//		}
//		page = (page -1) * 10;
//		return session.selectList(namespace+".listPage",page);
//	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listCriteria",cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".countPaging",cri);
	}

}
