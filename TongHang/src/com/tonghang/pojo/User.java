package com.tonghang.pojo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("user")
public class User{
    private int id;
    private String number;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String sex;
    private Date birth;
    public String status;
    public String isonline;
    private String provence;
    private String image;
    private Date created_at;
    private Date last_login_at;

    public String getIsonline() {
		return isonline;
	}

	public void setIsonline(String isonline) {
		this.isonline = isonline;
	}

	public void setId(int id) {
        this.id = id;
    }

    public void setStatus(String status){ this.status = status;}

    public void setNumber(String number) {this.number = number;}

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public void setProvence(String provence) {
        this.provence = provence;
    }

    public void setImage(String image) {
        this.image = image;
    }


    public int getId() {
        return id;
    }

    public String getNumber() {return number;}

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getSex() {
        return sex;
    }

    public Date getBirth() {
        return birth;
    }

    public String getProvence() {
        return provence;
    }

    public String getStatus(){ return status;}

    public String getImage() {
        return image;
    }

    public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getLast_login_at() {
		return last_login_at;
	}

	public void setLast_login_at(Date last_login_at) {
		this.last_login_at = last_login_at;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
