package clases;



/**
 * Created by diego on 25/02/16.
 */
public class MunicipalityEvent extends Event {
    private  String email;
    private String address_id;
    public MunicipalityEvent(String name, String description, String start_date, String end_date, String responsable_id, String contact_number, String email, String address_id){
        super(name,description,start_date,end_date,responsable_id,contact_number);
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress_id() {
        return address_id;
    }

    public void setAddress_id(String address_id) {
        this.address_id = address_id;
    }
}
