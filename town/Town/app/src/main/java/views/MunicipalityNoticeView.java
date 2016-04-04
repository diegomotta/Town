package views;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.amulyakhare.textdrawable.TextDrawable;
import com.amulyakhare.textdrawable.util.ColorGenerator;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.exactas.town.ContentEvent;
import com.exactas.town.R;
import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import clases.GsonRequest;
import encapsulations.ListaMunicipalityNotice;
import clases.MunicipalityNotice;
import clases.MySingleton;
import clases.Server;
import clases.SharedPreference;


public class MunicipalityNoticeView extends  RecyclerView.Adapter<MunicipalityNoticeView.ViewHolder>  {

    private static final String URL_BASE = "http://panambi.town.com:3000/api/municipalities/5/municipality_notices.json";
    private static final String TAG = "MunicipalityNoticeView";
    static ListaMunicipalityNotice municipality_notices;
    private ArrayList<MunicipalityNotice> notices = new ArrayList<>();
    private static Activity act = null;
    private Map<String, String> headers = new HashMap<String, String>();
    private Context context;
    static ListaMunicipalityNotice obj;
    public Context getContext() {
        return context;
    }

    public void setContext(Context context) {
        this.context = context;
    }

    public MunicipalityNoticeView(Context context) {
        act = ((Activity) context);
        setContext(context);
        final SharedPreference shpref = new SharedPreference(context);
        Server server = new Server(context,shpref);
        server.myWebServiceFun();
        headers.put("Authorization", shpref.getObjetoToken());
        MySingleton.getInstance(getContext()).addToRequestQueue(
                new GsonRequest<ListaMunicipalityNotice>(
                        URL_BASE,
                        ListaMunicipalityNotice.class,
                        headers,
                        new Response.Listener<ListaMunicipalityNotice>() {
                            @Override
                            public void onResponse(ListaMunicipalityNotice response) {
                                municipality_notices = response;
                                shpref.guardarNotice(municipality_notices);
                            }
                        },
                        new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.d(TAG, "Error Volley:" + error.getMessage());
                            }
                        }
                )
        );
        MySingleton.getInstance(context).getRequestQueue().getCache().clear();
        Gson gson = new Gson();
        String json = shpref.getObjetoNotice();
        obj = gson.fromJson(json, ListaMunicipalityNotice.class);

    }

    @Override
    public MunicipalityNoticeView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        // create a new view
        View v = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.cards_layout, parent, false);
        // set the view's size, margins, paddings and layout parameters
        ViewHolder vh = new ViewHolder(v);
        return vh;
    }

    // Replace the contents of a view (invoked by the layout manager)
    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        // - get element from your dataset at this position
        holder.txtDescription.setText(obj.getItems().get(position).getDescription());
        holder.txtTitle.setText(obj.getItems().get(position).getTitle());
        String letra = obj.getItems().get(position).getTitle();
        ColorGenerator generator = ColorGenerator.MATERIAL; // or use DEFAULT

        int color = generator.getRandomColor();

        int color1 = generator.getRandomColor();
        TextDrawable.IBuilder builder = TextDrawable.builder()
                .beginConfig()
                .endConfig()
                .round();
        String letraMayuscula = (letra.substring(0,1).toUpperCase());

        TextDrawable ic1 = builder.build(""+letraMayuscula+"", color1);

        holder.imageEvent.setImageDrawable(ic1 );

    }

    @Override
    public int getItemCount() {
        return obj  != null ? obj.getItems().size() : 0;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public final CardView cv;
        public TextView txtTitle;
        public TextView txtDescription;
        ImageView imageEvent;
        public View mView;
        public ViewHolder(View v) {
            super(v);
            cv = (CardView) v.findViewById(R.id.card_view);
            txtTitle = (TextView) v.findViewById(R.id.textoTitulo);
            txtDescription = (TextView) v.findViewById(R.id.textoDescripcion);
            imageEvent = (ImageView) v.findViewById(R.id.imagenPost);
            mView = v;
            cv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent( act, ContentEvent.class);

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        imageEvent.setTransitionName(act.getString(R.string.change_image_transform));
                        ActivityOptionsCompat options = ActivityOptionsCompat.
                                makeSceneTransitionAnimation(act, imageEvent, "change_image_transform");
                        act.startActivity(intent, options.toBundle());
                    }
                    else {
                        act.startActivity(intent);
                    }
                }

            });
        }
    }

    @Override
    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
    }
}

