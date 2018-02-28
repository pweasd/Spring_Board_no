package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyDAO {

	  public List<ReplyVO> list(Integer id) throws Exception;

	  public void create(ReplyVO vo) throws Exception;

	  public void update(ReplyVO vo) throws Exception;

	  public void delete(Integer num) throws Exception;

	  public List<ReplyVO> listPage(
			  Integer id, Criteria cri)throws Exception;
	  
	  public int count(Integer id)throws Exception;

}
