/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuchlh.user;

/**
 *
 * @author Phúc
 */
public class UserErrorDTO {
    private String userIDError;
    private String passwordError;
    private String confirmError;
    private String fullnameError;
    private String addressError;

    public UserErrorDTO() {
        this.userIDError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.fullnameError = "";
        this.addressError = "";
    }

    public UserErrorDTO(String userIDError, String passwordError, String confirmError, String fullnameError, String addressError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.fullnameError = fullnameError;
        this.addressError = addressError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getFullnameError() {
        return fullnameError;
    }

    public void setFullnameError(String fullnameError) {
        this.fullnameError = fullnameError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }
    
    
}
