package fragments;

/**
 * Created by diego on 10/03/16.
 */
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import views.MunicipalityEventView;
import com.exactas.town.R;

import java.util.ArrayList;
import java.util.List;

import clases.MunicipalityEvent;


public class MunicipalityEventFragment extends Fragment {
    private RecyclerView mRecyclerView;
    private MunicipalityEventView mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    private LinearLayoutManager mLinearLayoutManager;
    private List<MunicipalityEvent> movieList = new ArrayList<MunicipalityEvent>();
    public MunicipalityEventFragment() {

    }

    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        View evenfragment = inflater.inflate(R.layout.municipality_fragment_event, container, false);
        mRecyclerView = (RecyclerView) evenfragment.findViewById(R.id.my_recycler_view_municipality_notice);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(evenfragment.getContext());
        mRecyclerView.setLayoutManager(mLayoutManager);
        mAdapter = new MunicipalityEventView(evenfragment.getContext());
        mRecyclerView.setAdapter(mAdapter);
        mLinearLayoutManager = new LinearLayoutManager(getActivity());
        mLinearLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        mRecyclerView.setLayoutManager(mLinearLayoutManager);
        return evenfragment;
    }

}

