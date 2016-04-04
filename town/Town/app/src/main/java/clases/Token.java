package clases;

/**
 * Created by diego on 25/02/16.
 */
public class Token {
    String auth_token;
    public Token(){}

    public  Token(String auth_token){
        this.auth_token = auth_token;
    }

    public String getAuth_token() {
        return auth_token;
    }

    public void setAuth_token(String auth_token) {
        this.auth_token = auth_token;
    }
}
