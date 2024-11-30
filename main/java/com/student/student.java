package com.student;

public class student {
    private int idStudent;
    private String nameStudent;
    private String addressStudent;
    private String DOB_Student;
    private String contactNoStudent; 
    private String genderStudent;
 
    public student(int idStudent, String nameStudent, String addressStudent, String dOB_Student,
            String contactNoStudent, String genderStudent) {
        
        this.idStudent = idStudent;
        this.nameStudent = nameStudent;
        this.addressStudent = addressStudent;
        this.DOB_Student = dOB_Student;
        this.contactNoStudent = contactNoStudent;
        this.genderStudent = genderStudent;
        
    }

    // Getter methods

    public int getIdStudent() {
        return idStudent;
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public String getAddressStudent() {
        return addressStudent;
    }

    public String getDOB_Student() {
        return DOB_Student;
    }

    public String getContactNoStudent() {
        return contactNoStudent;
    }

    public String getGenderStudent() {
        return genderStudent;
    }


    // Setter methods

    public void setIdStudent(int idStudent) {
        this.idStudent = idStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent;
    }

    public void setAddressStudent(String addressStudent) {
        this.addressStudent = addressStudent;
    }

    public void setDOB_Student(String DOB_Student) {
        this.DOB_Student = DOB_Student;
    }

    public void setContactNoStudent(String contactNoStudent) {
        this.contactNoStudent = contactNoStudent;
    }

    public void setGenderStudent(String genderStudent) {
        this.genderStudent = genderStudent;
    }

    
    
    public student() {
    
}
}
