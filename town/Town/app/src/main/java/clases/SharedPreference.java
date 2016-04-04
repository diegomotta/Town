package clases;

import android.content.Context;
import android.content.SharedPreferences;

import com.google.gson.Gson;

import java.io.Serializable;
import java.security.SignatureSpi;

import encapsulations.ListaMunicipalityEvent;
import encapsulations.ListaMunicipalityNotice;
import encapsulations.ListaSupermarketEvent;
import encapsulations.ListaSupermarketNotice;

/**
 * Created by diego on 03/03/16.
 */
public class SharedPreference implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Context context;
    private SharedPreferences preferencias;
    private static final String COLECCION = "com.towns.town";
    private static final String TOKEN = "token";
    private static final String EVENT = "event";
    private static final String NOTICE = "notice";
    private static final String SUPERMARKETNOTICE = "supermarketnotice";
    private static final String SUPERMARKETEVENT = "supermarketevent";
    public SharedPreference(Context contex) {
        setContext(contex);
        preferencias = context.getSharedPreferences(COLECCION, Context.MODE_PRIVATE);

    }

    public Context getContext() {
        return context;
    }

    public void setContext(Context context) {
        this.context = context;
    }

    public SharedPreferences getPreferencias() {
        return preferencias;
    }

    public void setPreferencias(SharedPreferences preferencias) {
        this.preferencias = preferencias;
    }

    public static String getColeccion() {
        return COLECCION;
    }
    /*  public void guardarIdEmpresa(Integer idEmpresa) {
        SharedPreferences.Editor editor = preferencias.edit();
        editor.putInt(ID_EMPRESA, idEmpresa);
        editor.commit();
    }*/

    public void guardarToken(String objeto) {
        SharedPreferences.Editor editor = preferencias.edit();
        editor.putString(TOKEN, objeto);
        editor.commit();
    }

    public void guardarEvento(ListaMunicipalityEvent objeto) {
        SharedPreferences.Editor editor = preferencias.edit();
        Gson gson = new Gson();
        String json = gson.toJson(objeto);
        editor.putString(EVENT, json);
        editor.commit();
    }

    public void guardarNotice(ListaMunicipalityNotice objeto) {
        SharedPreferences.Editor editor = preferencias.edit();
        Gson gson = new Gson();
        String json = gson.toJson(objeto);
        editor.putString(NOTICE, json);
        editor.commit();
    }

    public void guardarSupermarketNotice(ListaSupermarketNotice objeto) {
        SharedPreferences.Editor editor = preferencias.edit();
        Gson gson = new Gson();
        String json = gson.toJson(objeto);
        editor.putString(SUPERMARKETNOTICE, json);
        editor.commit();
    }

    public void guardarSupermarketEvent(ListaSupermarketEvent objeto) {

        SharedPreferences.Editor editor = preferencias.edit();
        Gson gson = new Gson();
        String json = gson.toJson(objeto);
        editor.putString(SUPERMARKETEVENT, json);
        editor.commit();
    }

    public String getObjetoToken() {
        return preferencias.getString(TOKEN, null);
    }
    public String getObjetoEvento() {
        return preferencias.getString(EVENT, null);
    }

    public String getObjetoNotice() {
        return preferencias.getString(NOTICE, null);
    }

    public String getObjetoSupermarketNotice() {
        return preferencias.getString(SUPERMARKETNOTICE, null);
    }
    public String getObjetoSupermarketEvent() {
        return preferencias.getString(SUPERMARKETEVENT, null);
    }
}
