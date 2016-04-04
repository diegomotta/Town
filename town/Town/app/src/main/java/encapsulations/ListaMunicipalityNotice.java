package encapsulations;

import java.util.List;

import clases.MunicipalityNotice;

/**
 * Created by diego on 23/03/16.
 */
public class ListaMunicipalityNotice {
    // Encapsulamiento de Notice
    private List<MunicipalityNotice> municipality_notices;

    public ListaMunicipalityNotice(List<MunicipalityNotice> municipality_notices) {
        this.municipality_notices = municipality_notices;
    }

    public void setItems(List<MunicipalityNotice> municipality_events) {
        this.municipality_notices = municipality_notices;
    }

    public List<MunicipalityNotice> getItems() {
        return municipality_notices;
    }

}