
package clases;

/**
 * Created by diego on 25/02/16.
 */
public class Event  {

    private String name;
    private String description;
    private String start_date;
    private String end_date;
    private String responsable_id;
    private transient String email;

    public Event(String name, String description, String start_date, String end_date, String responsable_id,String email){
        this.name = name;
        this.description = description;
        this.end_date = end_date;
        this.responsable_id = responsable_id;
        this.start_date = start_date;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResponsable_id() {
        return responsable_id;
    }

    public void setResponsable_id(String responsable_id) {
        this.responsable_id = responsable_id;
    }
}