package spring.dto.contact;

import java.util.Date;

import lombok.Data;

@Data
public class Contact {
	private String seq;
	private String name;
	private String email;
	private String phone;
	private String message;
	private Date reg_date;
}
