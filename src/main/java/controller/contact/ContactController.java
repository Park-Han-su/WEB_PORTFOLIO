package controller.contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import spring.dto.contact.Contact;
import spring.service.contact.ContactService;

@RestController
public class ContactController {
	
	@Autowired
	ContactService contactService;

	@PostMapping("/contact")
	public ResponseEntity contact(@RequestBody Contact contact, Model model) {
		return ResponseEntity.ok(contactService.contactMe(contact));
	}
}
