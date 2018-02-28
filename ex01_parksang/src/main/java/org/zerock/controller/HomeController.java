package org.zerock.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.persistence.BoardDAO;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	@Inject
	private BoardDAO dao;
	
	@Inject
	private BoardService service;

	@RequestMapping(value = "/", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String registerGET(BoardVO board,Model model)throws Exception {
		//logger.info(board.toString());
		//insert
		//dao.create(board);
		//List<BoardVO> list;
		//list = service.listAll();
		//model.addAttribute("list", list);
		return "redirect:board_listPage";
	}
//	@RequestMapping(value = "board_view", method = RequestMethod.GET)
//	public String read(@RequestParam("id") int id, Model model)throws Exception{
//		
//		model.addAttribute(service.read(id));
//		//조회수 업데이트
//		dao.updateview(id);
//	
//		return "board_view";
//	}
	@RequestMapping(value = "board_viewPage", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String read(@RequestParam("id") int id,@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		
		model.addAttribute(service.read(id));
		//조회수 업데이트
		dao.updateview(id);
	
		return "board_viewPage";
	}
	//글쓰기 형식
	@RequestMapping(value="board_insertForm", produces="application/json; charset=UTF-8")
	public String insertForm(Model model) {
	
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date currentTime = new Date();
		//현재시간
		model.addAttribute("datetime", dayTime.format(currentTime));
		return "board_insertForm";
	}
	//취소버튼(목록버튼)
	@RequestMapping("list")
	public String list() {
		
		return "redirect:/";
	}

	//쓰기버튼
	@RequestMapping(value="board_write",method = RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String write(BoardVO board)throws Exception {
		logger.info(board.toString());
		service.regist(board);
		return "redirect:/";
	}
	//수정 형식
	@RequestMapping(value="board_updateForm", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String updateForm(@RequestParam("id") int id,@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
		//sql실행할땐 모델이 필요없지만, 값을 넘길땐 필요함
		model.addAttribute(service.read(id));
		return "board_updateForm";
	}
	//수정버튼
	@RequestMapping(value="board_update", method = RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String update(@RequestParam("id") int id, @RequestParam("title") String title,
			@RequestParam("content") String content,BoardVO board,Criteria cri, RedirectAttributes rttr)throws Exception {
//		BoardVO bo = new BoardVO();
//		bo.setId(id);
//		bo.setTitle(title);
//		bo.setContent(content);
//		
//		service.modify(bo);
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:board_listPage";
	}
	//삭제버튼
	@RequestMapping(value="board_delete", method = RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String delete(@RequestParam("id") int id,
			Criteria cri,
				RedirectAttributes rttr)throws Exception{
		
		service.remove(id);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg","SUCCESS");		
		
		return "redirect:board_listPage";
	}
	@RequestMapping(value = "board_listPage", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String testpage(@ModelAttribute("cri")Criteria cri,Model model)throws Exception {
	
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(14);
		pageMaker.setTotalCount(service.listCountPaging(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "board_listPage";
	}
//	@RequestMapping(value = "mocrok", method = RequestMethod.GET)
//	public String mocrok(@RequestParam("id") int id, Model model,
//			@ModelAttribute("cri") Criteria cri)throws Exception {
//		
//		model.addAttribute(service.read(id));
//		//return "redirect:/";
//		return "redirect:board_listPage";
//	}
	
}
