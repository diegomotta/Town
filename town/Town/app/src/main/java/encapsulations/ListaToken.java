package encapsulations;

import java.util.List;

import clases.Token;

/**
 * Created by diego on 01/03/16.
 */
public class ListaToken {
    // Encapsulamiento del Token
    private List<Token> token;

    public ListaToken(List<Token> token) {
        this.token = token;
    }

    public void setTokens(List<Token> token) {
        this.token = token;
    }

    public List<Token> getTokens() {
        return token;
    }
}
