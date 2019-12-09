package person;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import person.PersonDTO;

public class PersonDAO {

	private Connection conn; // DB ���� ��ü
	private ResultSet rs;

	public PersonDAO() { // ������: ���� �� ���� �ڵ����� DB ���� ���
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs" + "?useUnicode=true&characterEncoding=UTF-8&mysqlEncoding=UTF-8"; // Mysql �ּ� ��
																											// ���ڵ�
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // � �������� ���
		}
	}

	public int getNext() {
		String SQL = "SELECT listNumber FROM PERSON ORDER BY listNumber DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // ���簡 ù��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	public ArrayList<PersonDTO> getList(int pageNumber) {
		String SQL = "SELECT * FROM PERSON WHERE listNumber < ? ORDER BY listNumber DESC LIMIT 100";
		ArrayList<PersonDTO> list = new ArrayList<PersonDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 100);
			rs = pstmt.executeQuery();
			int listNumber = 0;
			String name = null;
			String department = null;
			String personalCode = null;
			String phoneNumber = null;
			String email = null;
			String address = null;
			while (rs.next()) {
				PersonDTO personDTO = new PersonDTO(listNumber, name, department, personalCode, phoneNumber, email,
						address);
				personDTO.setListNumber(rs.getInt(1));
				personDTO.setPersonalCode(rs.getString(2));
				personDTO.setName(rs.getString(3));
				personDTO.setDepartment(rs.getString(4));
				personDTO.setPhoneNumber(rs.getString(5));
				personDTO.setEmail(rs.getString(6));
				personDTO.setAddress(rs.getString(7));
				list.add(personDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int register(PersonDTO personDTO) {
		String SQL = "INSERT INTO PERSON VALUES(?,?,?,?,?,?,?)"; // insert�� ������ ����� 0�̻� ��ȯ
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, personDTO.getPersonalCode());
			pstmt.setString(3, personDTO.getName());
			pstmt.setString(4, personDTO.getDepartment());
			pstmt.setString(5, personDTO.getPhoneNumber());
			pstmt.setString(6, personDTO.getEmail());
			pstmt.setString(7, personDTO.getAddress());
			return pstmt.executeUpdate(); // 0 �̻��� ��� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<PersonDTO> info(int listNumber) {
		String SQL = "SELECT * FROM PERSON WHERE listNumber = ?";
		ArrayList<PersonDTO> personList = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, listNumber);
			rs = pstmt.executeQuery();
			personList = new ArrayList<PersonDTO>();
			String name = null;
			String department = null;
			String personalCode = null;
			String phoneNumber = null;
			String email = null;
			String address = null;
			while (rs.next()) {
				PersonDTO personDTO = new PersonDTO(listNumber, name, department, personalCode, phoneNumber, email,
						address);
				personDTO.setListNumber(rs.getInt(1));
				personDTO.setPersonalCode(rs.getString(2));
				personDTO.setName(rs.getString(3));
				personDTO.setDepartment(rs.getString(4));
				personDTO.setPhoneNumber(rs.getString(5));
				personDTO.setEmail(rs.getString(6));
				personDTO.setAddress(rs.getString(7));
				personList.add(personDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return personList;
	}

	public int update(PersonDTO personDTO) {
		String SQL = "UPDATE PERSON SET personalCode = ?, name = ?, department = ?, phoneNumber = ?, email = ?, address = ? WHERE listNumber = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, personDTO.getPersonalCode());
			pstmt.setString(2, personDTO.getName());
			pstmt.setString(3, personDTO.getDepartment());
			pstmt.setString(4, personDTO.getPhoneNumber());
			pstmt.setString(5, personDTO.getEmail());
			pstmt.setString(6, personDTO.getAddress());
			pstmt.setInt(7, personDTO.getListNumber());
			return pstmt.executeUpdate(); // 0 �̻��� ��� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

	public int delete(int listNumber) {
		String SQL = "DELETE FROM PERSON WHERE listNumber = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, listNumber);
			return pstmt.executeUpdate(); // 0 �̻��� ��� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ���̽� ����
	}

}
