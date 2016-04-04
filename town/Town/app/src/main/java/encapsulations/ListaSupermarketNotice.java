package encapsulations;

import java.util.List;

import clases.SupermarketEvent;
import clases.SupermarketNotice;

/**
 * Created by diego on 23/03/16.
 */
public class ListaSupermarketNotice {

    private List<SupermarketNotice> supermarket_notices;

    public ListaSupermarketNotice(List<SupermarketNotice> supermarket_notices) {
        this.supermarket_notices = supermarket_notices;
    }

    public void setItems(List<SupermarketNotice> supermarket_notices) {
        this.supermarket_notices = supermarket_notices;
    }

    public List<SupermarketNotice> getItems() {
        return supermarket_notices;
    }
}
