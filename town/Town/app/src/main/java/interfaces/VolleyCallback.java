package interfaces;

import org.json.JSONException;

import clases.Token;

public interface VolleyCallback {
    void onSuccessResponse(Token result) throws JSONException;

}