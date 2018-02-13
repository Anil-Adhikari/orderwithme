package com.focuson.orderwithme.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

@Entity(name="orderwithme_user")
@Table(name="orderwithme_user")
public class User implements Serializable{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="userId")
    private int userId;

    @Column(name = "ord_user_uuid")
    private UUID useruuid;

    @Column(name = "ord_user_firstname")
    private String firstName;

    @Column(name = "ord_user_lastname")
    private String lastName;

    @Column(name = "ord_user_address")
    private String address;

    @Column(name = "ord_user_email")
    private String email;

    @Column(name = "ord_user_phone")
    private String phone;

    @Column(name = "ord_user_password")
    private String password;

    @Column(name = "ord_user_password_hash")
    private String passwordHash;

    @Column(name = "ord_user_password_reset_token")
    private String passwordResetToken;

    @Column(name = "ord_user_created_date")
    private Date createdDate;

    @Column(name = "ord_user_isupdated")
    private int isUpdated;

    @Column(name = "ord_user_updated_date")
    private Date updatedDate;

    @Column(name = "ord_user_iscustomer")
    private int isCustomer;

    @Column(name = "ord_user_geolocation")
    private String geoLocation;

    public User(){
        this.useruuid = UUID.randomUUID();
        this.createdDate = new Date();
        this.isCustomer = 1;
        this.isUpdated = 0;
        this.passwordResetToken = null;
        this.updatedDate = null;
        this.geoLocation = null;
    }

    public User(String firstName, String lastName, String address, String email, String phone, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.passwordHash = String.valueOf(password.hashCode());
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUseruuid(UUID useruuid) {
        this.useruuid = useruuid;
    }

    public UUID getUseruuid() {
        return useruuid;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getPasswordResetToken() {
        return passwordResetToken;
    }

    public void setPasswordResetToken(String passwordResetToken) {
        this.passwordResetToken = passwordResetToken;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getIsUpdated() {
        return isUpdated;
    }

    public void setIsUpdated(int isUpdated) {
        this.isUpdated = isUpdated;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public int getIsCustomer() {
        return isCustomer;
    }

    public void setIsCustomer(int isCustomer) {
        this.isCustomer = isCustomer;
    }

    public String getGeoLocation() {
        return geoLocation;
    }

    public void setGeoLocation(String geoLocation) {
        this.geoLocation = geoLocation;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", useruuid=" + useruuid.toString() +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", passwordHash='" + passwordHash + '\'' +
                ", createdDate=" + createdDate.toString() +
                ", isUpdated=" + isUpdated +
                ", isCustomer=" + isCustomer +
                '}';
    }
}
