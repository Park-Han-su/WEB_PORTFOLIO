package spring.dao.contact;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.dto.contact.Contact;

@Repository
public class ContactDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int contactMe(Contact contact) {
		return sqlSession.insert("mappers.ContactMapper.contactInsert", contact);
	}
	
	public List<Contact> selectContact(){
		return sqlSession.selectList("mappers.ContactMapper.contactSelect");
	}
	
	public int deleteContact(Contact contact) {
		return sqlSession.delete("mappers.ContactMapper.contactDelete", contact);
	}

}
