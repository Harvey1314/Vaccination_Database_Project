/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

/**
 *
 * @author trannhi
 */
public class RetrieveInfo {
    private String  lastname, firstname, birthdate, zipcode, dosenumber, lotnumber;
   
    public RetrieveInfo() {
        this.lastname = "";
        this.firstname = "";
        this.birthdate = "";
        this.zipcode = "";
        this.dosenumber = "";
        this.lotnumber = "";
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getDosenumber() {
        return dosenumber;
    }

    public void setDosenumber(String dosenumber) {
        this.dosenumber = dosenumber;
    }

    public String getLotnumber() {
        return lotnumber;
    }

    public void setLotnumber(String lotnumber) {
        this.lotnumber = lotnumber;
    }
    
}
