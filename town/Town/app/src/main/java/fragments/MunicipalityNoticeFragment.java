package fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import views.MunicipalityNoticeView;
import com.exactas.town.R;

/**
 * Created by diego on 10/03/16.
 */
public class MunicipalityNoticeFragment extends Fragment {
    private RecyclerView mRecyclerView;
    private MunicipalityNoticeView mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    private LinearLayoutManager mLinearLayoutManager;
    public MunicipalityNoticeFragment() {
        // Required empty public constructor
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View evenfragment = inflater.inflate(R.layout.municipality_fragment_notice, container, false);
        mRecyclerView = (RecyclerView) evenfragment.findViewById(R.id.my_recycler_view_municipality_notice);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(evenfragment.getContext());
        mRecyclerView.setLayoutManager(mLayoutManager);
        mAdapter = new MunicipalityNoticeView(evenfragment.getContext());
        mRecyclerView.setAdapter(mAdapter);
        mAdapter.notifyDataSetChanged();
        mLinearLayoutManager = new LinearLayoutManager(evenfragment.getContext());
        mLinearLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        mRecyclerView.setLayoutManager(mLinearLayoutManager);
        return evenfragment;
    }

}