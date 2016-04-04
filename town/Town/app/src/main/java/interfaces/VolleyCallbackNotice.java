package interfaces;

import org.json.JSONException;

import encapsulations.ListaMunicipalityNotice;

/**
 * Created by diego on 18/03/16.
 */
public interface VolleyCallbackNotice {
    void onSuccessResponse(ListaMunicipalityNotice result) throws JSONException;
}
