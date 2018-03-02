package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	  public ResponseEntity<String> register(@RequestBody ReplyVO vo) {

	    ResponseEntity<String> entity = null;
	    try {
	      service.addReply(vo);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	@RequestMapping(value = "/all/{id}",method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(
			@PathVariable("id") Integer id){
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(
					service.listReply(id),HttpStatus.OK);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//수정 test
	@RequestMapping(value = "/{num}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	  public ResponseEntity<String> update(@PathVariable("num") Integer num, @RequestBody ReplyVO vo) {

	    ResponseEntity<String> entity = null;
	    try {
	      vo.setNum(num);
	      service.modifyReply(vo);

	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	//삭제 test
	@RequestMapping(value = "/{num}", method = RequestMethod.DELETE)
	  public ResponseEntity<String> remove(@PathVariable("num") Integer num) {

	    ResponseEntity<String> entity = null;
	    try {
	      service.removeReply(num);
	      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
	
	@RequestMapping(value = "/{id}/{page}", method = RequestMethod.GET)
	  public ResponseEntity<Map<String, Object>> listPage(
	      @PathVariable("id") Integer id,
	      @PathVariable("page") Integer page) {

	    ResponseEntity<Map<String, Object>> entity = null;
	    
	    try {
	      Criteria cri = new Criteria();
	      cri.setPage(page);

	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);

	      Map<String, Object> map = new HashMap<String, Object>();
	      List<ReplyVO> list = service.listReplyPage(id, cri);

	      map.put("list", list);

	      int replyCount = service.count(id);
	      pageMaker.setTotalCount(replyCount);

	      map.put("pageMaker", pageMaker);

	      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	  }
}
