package clases;

/**
 * Created by diego on 23/03/16.
 */
public class Notice {
    private String description;
    private String start_date;
    private String end_date;
    private String responsable_id;
    private String email;
    private String title;

    public Notice(String description,String start_date,String end_date,String responsable_id,String email,String title){
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
        this.responsable_id = responsable_id;
        this.email = email;
        this.title = title;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getResponsable_id() {
        return responsable_id;
    }

    public void setResponsable_id(String responsable_id) {
        this.responsable_id = responsable_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
