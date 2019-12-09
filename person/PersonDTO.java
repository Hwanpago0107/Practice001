package person;

public class PersonDTO {

	int listNumber;
	String personalCode;
	String name;
	String department;
	String phoneNumber;
	String email;
	String address;

	public int getListNumber() {
		return listNumber;
	}

	public void setListNumber(int listNumber) {
		this.listNumber = listNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPersonalCode() {
		return personalCode;
	}

	public void setPersonalCode(String personalCode) {
		this.personalCode = personalCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public PersonDTO(int listNumber, String name, String department, String personalCode, String phoneNumber,
			String email, String address) {
		super();
		this.listNumber = listNumber;
		this.name = name;
		this.department = department;
		this.personalCode = personalCode;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
	}


}
