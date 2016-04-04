package encapsulations;

import java.util.List;

import clases.SupermarketEvent;

/**
 * Created by diego on 23/03/16.
 */
public class ListaSupermarketEvent {

    private List<SupermarketEvent> supermarket_events;

    public ListaSupermarketEvent(List<SupermarketEvent> supermarket_events) {
        this.supermarket_events = supermarket_events;
    }

    public void setItems(List<SupermarketEvent> supermarket_events) {
        this.supermarket_events = supermarket_events;
    }

    public List<SupermarketEvent> getItems() {
        return supermarket_events;
    }

}
