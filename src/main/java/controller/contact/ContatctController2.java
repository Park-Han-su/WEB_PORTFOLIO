package controller.contact;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import spring.dto.contact.Contact;
import spring.service.contact.ContactService;

@Controller
public class ContatctController2 {
	
	@Autowired
	ContactService contactService;

	@GetMapping("contactList")
	public String contactMe(Model model) {
		model.addAttribute("test", contactService.selectContact());
		return "board/contactMe";
	}
	
	@PostMapping("/contact/delete")
	public String contaceDelete(Contact contact, Model model, HttpServletRequest request) {
		int count = contactService.deleteContact(contact);
		if(count == 1) {
			model.addAttribute("msg", "삭제완료");
			model.addAttribute("uri", request.getContextPath()+"/contactList");
		}else {
			model.addAttribute("msg", "삭제실패");
			model.addAttribute("uri", request.getContextPath()+"/contactList");
		}
		return "common/alert";
	}
}
