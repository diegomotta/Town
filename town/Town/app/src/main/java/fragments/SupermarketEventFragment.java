package fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.exactas.town.R;

import views.SupermarketEventView;

/**
 * Created by diego on 23/03/16.
 */
public class SupermarketEventFragment extends Fragment {
    private RecyclerView mRecyclerView;
    private SupermarketEventView mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    private LinearLayoutManager mLinearLayoutManager;

    public SupermarketEventFragment(){
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View evenfragment = inflater.inflate(R.layout.supermarket_fragment_event, container, false);
        mRecyclerView = (RecyclerView) evenfragment.findViewById(R.id.my_recycler_view_supermarket_event);
        mRecyclerView.setHasFixedSize(true);
        mLayoutManager = new LinearLayoutManager(evenfragment.getContext());
        mRecyclerView.setLayoutManager(mLayoutManager);
        mAdapter = new SupermarketEventView(evenfragment.getContext());
        mRecyclerView.setAdapter(mAdapter);
        mLinearLayoutManager = new LinearLayoutManager(getActivity());
        mLinearLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        mRecyclerView.setLayoutManager(mLinearLayoutManager);
        return evenfragment;
    }
}
