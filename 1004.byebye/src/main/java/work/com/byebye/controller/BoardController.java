package work.com.byebye.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.nhncorp.lucy.security.xss.XssPreventer;
import work.com.byebye.exception.RequiredException;

import work.com.byebye.dto.BoardDto;
import work.com.byebye.exception.AuthenticationException;
import work.com.byebye.service.BoardService;

@Controller
public class BoardController {

	List<BoardDto> list = new ArrayList<BoardDto>();
	/** spring di : setter injection */
	private BoardService service;

	@Autowired
	public void setService(BoardService service) {
		this.service = service;
	}

	//home 화면에 사진호출 남의 사진 
	 @RequestMapping(value="index.do")
	   public  @ResponseBody ModelAndView index(@CookieValue(value="lon", defaultValue="0") Double lon , @CookieValue(value="lat", defaultValue="0") Double lat,HttpSession session) throws RequiredException {
			String userid = (String) session.getAttribute("userid");

			list = service.index(userid,lon,lat);

			ModelAndView mv = new ModelAndView();
			if (userid != null) {
				mv.addObject("list", list);
				mv.setViewName("index");
			} else {
				mv.addObject("message", "Error go back to the Back page.");
				mv.setViewName("error/errorPage");
			}
			return mv;
	  }
	   
	
	@RequestMapping("insertBoard.do")
	public String BoardDtoView() {
		return "board/insertBoard";
	}

	private String BoardDtoPath = "c://temp//BoardDto";

	@RequestMapping(value = "multiInsert.do", method = RequestMethod.POST)
	public ModelAndView multiInsert(@CookieValue(value="lon", defaultValue="0") Double lon , @CookieValue(value="lat", defaultValue="0") Double lat, MultipartHttpServletRequest request, Model model,
			HttpSession session) throws IOException, AuthenticationException {
		ModelAndView mv = new ModelAndView();
		MultipartFile multi = request.getFile("picFile");
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String docTf = request.getParameter("docTf");
		if(docTf == null) {
			docTf = "no";
		}
		String docTle = XssPreventer.escape(request.getParameter("docTle"));
		String docCon = XssPreventer.escape(request.getParameter("docCon"));
		String docTag = XssPreventer.escape(request.getParameter("docTag"));
		String place = XssPreventer.escape(request.getParameter("place"));
		String userid = (String) session.getAttribute("userid");
		String picFile = userid + "_" + date + ".jpg";

		int result = service.insertBoard(userid, lat, lon, picFile, docTf, docTle, docCon, docTag, place);
		if (result == 1) {
			File file = new File(BoardDtoPath, picFile);
			multi.transferTo(file);
			mv.setViewName("redirect:myBoardList.do");
		} else {
			mv.addObject("message", "Insert Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}

	/** 사진 리스트 조회요청 */
	@RequestMapping("myBoardList.do")
	public @ResponseBody ModelAndView myBoardList(@CookieValue(value="lon", defaultValue="0") Double lon , @CookieValue(value="lat", defaultValue="0") Double lat,HttpSession session) {
		String userid = (String) session.getAttribute("userid");

		list = service.myPlace(userid,lon,lat);
		
		ModelAndView mv = new ModelAndView();
		if (userid != null) {
			mv.addObject("list", list);
			mv.setViewName("board/myBoardList");
		} else {
			mv.addObject("message", "Search Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}
	
	/** 남의사진 리스트 조회요청 */
	@RequestMapping("otherPlaceList.do")
	public @ResponseBody ModelAndView otherPlaceList(@CookieValue(value="lon", defaultValue="0") Double lon , @CookieValue(value="lat", defaultValue="0") Double lat,HttpSession session,HttpServletRequest request) {
		String userid = (String) request.getParameter("id");

		list = service.myPlace(userid,lon,lat);
		
		ModelAndView mv = new ModelAndView();
		if (userid != null) {
			mv.addObject("list", list);
			mv.setViewName("board/myBoardList");
		} else {
			mv.addObject("message", "Search Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}
	
	/** 특정 아이디 리스트 */
	@RequestMapping("whoList.do")
	public @ResponseBody ModelAndView whoList(@CookieValue(value="lon", defaultValue="0") Double lon , @CookieValue(value="lat", defaultValue="0") Double lat,HttpSession session,HttpServletRequest request) {
		String userid = (String) request.getParameter("id");
		String nickname = (String) request.getParameter("nic");

		list = service.myPlace(userid,lon,lat);
		
		ModelAndView mv = new ModelAndView();
		if (userid != null) {
			mv.addObject("list", list);
			mv.addObject("otherNickname", nickname);
			mv.setViewName("board/otherBoardList");
		} else {
			mv.addObject("message", "Search Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("imgLoad.do")
	public @ResponseBody void imgLoad(HttpServletRequest request, HttpServletResponse response) {
		String path = "c://temp//BoardDto/" + request.getParameter("fileName");
		System.out.println("imgLoad:" + path);
		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(path));
			ByteArrayOutputStream byteStream = new ByteArrayOutputStream(512);
			int imageByte;
			while ((imageByte = in.read()) != -1) {
				byteStream.write(imageByte);
			}
			in.close();
			response.setContentType("image/jpg");
			byteStream.writeTo(response.getOutputStream());
		} catch (IOException ioe) {
		}
	}

	/** 사진 상세조회 */
	@RequestMapping("boardDetail.do")
	public ModelAndView myPlaceContent(HttpSession session, int seq) {
		BoardDto dto = new BoardDto();
		String userid = (String) session.getAttribute("userid");
		
		String docNum = String.valueOf(seq);

		dto = service.myPlaceContent(docNum);
		
		ModelAndView mv = new ModelAndView();
		if (userid != null) {
			mv.addObject("docNum", dto.getDocNum());
			mv.addObject("otherUserid", dto.getUserid());
			mv.addObject("otherNickname", dto.getNickname());
			mv.addObject("otherUserimg", dto.getUserimg());
			mv.addObject("lat", dto.getLat());
			mv.addObject("lon", dto.getLon());
			mv.addObject("picFile", dto.getPicFile());
			mv.addObject("docTle", dto.getDocTle());
			mv.addObject("docCon", dto.getDocCon());
			mv.addObject("docDate", dto.getDocDate());
			mv.addObject("docHit", dto.getDocHit());
			mv.addObject("docTf", dto.getDocTf());
			mv.addObject("docTag", dto.getDocTag());
			mv.setViewName("board/boardDetail");
		} else {
			mv.addObject("message", "Search Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}
	
	/** 남의 사진 상세조회 */
	@RequestMapping("otherBoardDetail.do")
	public ModelAndView indexContent(HttpSession session, int seq) {
		BoardDto dto = new BoardDto();
		String userid = (String) session.getAttribute("userid");
		String docNum = String.valueOf(seq);

		dto = service.indexContent(docNum);
		ModelAndView mv = new ModelAndView();
		if (userid != null) {
			mv.addObject("docNum", dto.getDocNum());
			mv.addObject("otherUserid", dto.getUserid());
			mv.addObject("otherNickname", dto.getNickname());
			mv.addObject("otherUserimg", dto.getUserimg());
			mv.addObject("lat", dto.getLat());
			mv.addObject("lon", dto.getLon());
			mv.addObject("picFile", dto.getPicFile());
			mv.addObject("docTle", dto.getDocTle());
			mv.addObject("docCon", dto.getDocCon());
			mv.addObject("docDate", dto.getDocDate());
			mv.addObject("docHit", dto.getDocHit());
			mv.addObject("docTf", dto.getDocTf());
			mv.addObject("docTag", dto.getDocTag());
			mv.addObject("place", dto.getPlace());
			mv.setViewName("board/boardDetail");
		} else {
			mv.addObject("message", "Search Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}
  
	// 사진 수정 뷰 이동
		@RequestMapping("updateContentView.do")
		public ModelAndView updateContentView(HttpSession session, int seq, HttpServletRequest request) {
			BoardDto dto = new BoardDto();
			String userid = (String) session.getAttribute("userid");
			String docNum = String.valueOf(seq);
			String userid2 = (String) request.getParameter("seq2");
			
			System.out.println("test update contentview" + userid + userid2);
			
			dto = service.myPlaceContent(docNum);
			ModelAndView mv = new ModelAndView();
			if (userid.equals(userid2)) {
				mv.addObject("docNum", dto.getDocNum());
				mv.addObject("userid", dto.getUserid());
				mv.addObject("lat", dto.getLat());
				mv.addObject("lon", dto.getLon());
				mv.addObject("picFile", dto.getPicFile());
				mv.addObject("docTle", dto.getDocTle());
				mv.addObject("docCon", dto.getDocCon());
				mv.addObject("docDate", dto.getDocDate());
				mv.addObject("docHit", dto.getDocHit());
				mv.addObject("docTf", dto.getDocTf());
				mv.addObject("docTag", dto.getDocTag());
				mv.addObject("place", dto.getPlace());
				mv.setViewName("board/updateBoard");
			} else {
				mv.addObject("message", "Update Error go back to the Back page.");
				mv.setViewName("error/errorPage");
			}
			return mv;
		}

	/**
	 * 수정 : 수정하려고하는 것만 선택해서 수정할 수 있음 수정 불가한거는 readOnly 명시
	 */
	@RequestMapping("updateContent.do")
	public ModelAndView updateContent(HttpSession session, HttpServletRequest request) {
		String docNum = (String) request.getParameter("seq");
		String docCon = (String) request.getParameter("docCon");
		String docTag = (String) request.getParameter("docTag");
		String place = (String) request.getParameter("place");
		String docTle  = (String) request.getParameter("docTle");
		int upt = service.updateContent(docCon, docNum, docTag, place,docTle);
		ModelAndView mv = new ModelAndView();
		if (upt > 0) {
			mv.setViewName("board/boardDetail");
		} else {
			mv.addObject("message", "Update Error go back to the Back page.");
			mv.setViewName("error/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("deletePlace.do")
	public String deletePlace(HttpSession session, HttpServletRequest request) {
		String docNum = (String) request.getParameter("seq");
		String userid = (String) session.getAttribute("userid");
		String userid2 = (String) request.getParameter("seq1");
		
		if(userid.equals(userid2)) {
			int delPlace = service.deletePlace(docNum);
			if(delPlace>0) {
				return "redirect:myBoardList.do";
			} else {
				request.setAttribute("message", "Delete Error go back to the Back page");
				return"error/errorPage";
			}
		}
		return"";
	}
	
	@ExceptionHandler
	public ModelAndView commonException(RequiredException e) {
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("message", "필수 항목 미입력");
		mnv.setViewName("error/errorPage");
		return mnv;
	}


}
