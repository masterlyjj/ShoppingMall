package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.CartVO;
import kr.co.service.CartService;

@Controller
@RequestMapping("cart")
public class CartController {

		@Inject
		private CartService cService;
		
		@RequestMapping(value = "/insert", method = RequestMethod.GET)
		public String insert(@ModelAttribute CartVO vo, HttpSession session, String member_id) {
//			String member_id = (String) session.getAttribute(member_id);
			vo.setMember_id(member_id);
			int count = cService.countCart(vo.getItem_no(), member_id);
			if (count == 0) {
				cService.insert(vo);
			} else {
				cService.update(vo);
			}
			return "redirect:/cart/read/"+vo.getMember_id();
		}
	
}