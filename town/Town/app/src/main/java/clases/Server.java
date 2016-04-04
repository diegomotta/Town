package clases;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.Log;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;

import org.json.JSONException;

import java.util.HashMap;
import java.util.Map;

import encapsulations.ListaToken;
import interfaces.VolleyCallback;

/**
 * Created by diego on 01/03/16.
 */
public class Server  implements VolleyCallback {

    private static final String TAG = "Class Server";
    private ListaToken token;
    private Map<String, String> headers = new HashMap<String, String>();
    private Context context;
    private SharedPreference shpref;
    private VolleyCallback callback;
    private String auth_token;
    static String json;


    public Server(Context context, SharedPreference shpref) {
        this.context = context;
        this.shpref = shpref;
    }


    public void myWebServiceFun() {

        String url = "http://panambi.town.com:3000/api/auth/token";
        getResponse(Request.Method.GET, url, null,
                new VolleyCallback() {
                    @TargetApi(Build.VERSION_CODES.KITKAT)
                    @Override
                    public void onSuccessResponse(Token result) throws JSONException {
                        auth_token = (result.getAuth_token());
                        json = auth_token;
                        shpref.guardarToken(json);
                    }


                });
       // return json;
    }

    private void getResponse(int get, String url, Object o, final VolleyCallback callback) {

        MySingleton.getInstance(context).addToRequestQueue(
                new GsonRequest<ListaToken>(
                        url,
                        ListaToken.class,
                        null,
                        new Response.Listener<ListaToken>(){
                            @Override
                            public void onResponse(ListaToken response) {
                                token = response;
                                try {
                                    callback.onSuccessResponse(token.getTokens().get(0));
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                            }
                        },
                        new Response.ErrorListener(){
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.d(TAG, "Error Volley:" + error.getMessage());
                            }
                        }
                )
        );

    }

    @Override
    public void onSuccessResponse(Token result) {
        try {
            callback.onSuccessResponse(result);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
