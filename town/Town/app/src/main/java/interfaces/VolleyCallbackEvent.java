package interfaces;

import org.json.JSONException;

import encapsulations.ListaMunicipalityEvent;

public interface VolleyCallbackEvent {
    void onSuccessResponse(ListaMunicipalityEvent result) throws JSONException;

}
