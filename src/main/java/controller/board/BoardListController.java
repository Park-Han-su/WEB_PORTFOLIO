package controller.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.common.Page;
import spring.dto.board.Board;
import spring.service.board.BoardService;

@Controller
@RequestMapping("/board")
public class BoardListController {

	@Autowired
	BoardService boardListService;

	@GetMapping("/list")
	public String boardList(Page page, Board board, Model model) {
		boardListService.readList(page, board, model);
		model.addAttribute("keyword", board.getKeyword());
		model.addAttribute("searchType", board.getSearchType());
		return "/board/boardList";
	}
	
	@GetMapping("/detail{seq}")
	public String boardDetail(Board board, Model model) {
		model.addAttribute("detail",boardListService.selectBoardAllList(board));
		return "/board/boardDetail";
	}
	
	@PostMapping("/delete{seq}")
	public String boardDelete(Board board, Model model, HttpServletRequest request) {
		int count = boardListService.deleteBoard(board);
		if(count == 1) {
			model.addAttribute("msg", "삭제완료");
			model.addAttribute("uri", request.getContextPath()+"/board/list");
		}else {
			model.addAttribute("msg", "삭제실패");
			model.addAttribute("uri", request.getContextPath()+"/board/list");
		}
		return "/common/alert";
	}

}
