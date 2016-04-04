package encapsulations;

import java.util.List;

import clases.MunicipalityEvent;

/**
 * Created by diego on 16/03/16.
 */
public class ListaMunicipalityEvent {
    // Encapsulamiento de Events
    private List<MunicipalityEvent> municipality_events;

    public ListaMunicipalityEvent(List<MunicipalityEvent> municipality_events) {
        this.municipality_events = municipality_events;
    }

    public void setItems(List<MunicipalityEvent> municipality_events) {
        this.municipality_events = municipality_events;
    }

    public List<MunicipalityEvent> getItems() {
        return municipality_events;
    }

}
