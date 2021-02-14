package spring.service.contact;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.dao.contact.ContactDAO;
import spring.dto.contact.Contact;

@Service
@Transactional
public class ContactService {

	@Autowired
	ContactDAO contactDAO;
	
	public int contactMe(Contact contact) {
		return contactDAO.contactMe(contact);
	}
	
	public List<Contact> selectContact(){
		return contactDAO.selectContact();
	}
	
	public int deleteContact(Contact contact) {
		return contactDAO.deleteContact(contact);
	}
}
