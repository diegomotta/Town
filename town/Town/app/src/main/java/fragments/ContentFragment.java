package fragments;

/**
 * Created by diego on 19/03/16.
 */

import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


import com.exactas.town.R;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 04-06-2015.
 */
public class ContentFragment extends Fragment {
    private TabLayout tabLayout;
    private ViewPager viewPager;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.content_fragment,container,false);
//        TabLayout tabLayout = (TabLayout) v.findViewById(R.id.tab_layout);
//        tabLayout.addTab(tabLayout.newTab().setText("Tab 1"));
//        tabLayout.addTab(tabLayout.newTab().setText("Tab 2"));
//        tabLayout.setTabGravity(TabLayout.GRAVITY_FILL);
//        final ViewPager viewPager = (ViewPager) v.findViewById(R.id.pager);
//        final PagerAdapter adapter = new PagerAdapter    (getFragmentManager(), tabLayout.getTabCount());
//        viewPager.setAdapter(adapter);
//        viewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));
//        tabLayout.setOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
//            @Override
//            public void onTabSelected(TabLayout.Tab tab) {
//                viewPager.setCurrentItem(tab.getPosition());
//
//
//            }
//
//            @Override
//            public void onTabUnselected(TabLayout.Tab tab) {
//
//            }
//
//            @Override
//            public void onTabReselected(TabLayout.Tab tab) {
//
//            }
//        });

        viewPager =(ViewPager) v.findViewById(R.id.viewpagerr);
        setupViewPagerr(viewPager);
        tabLayout=(TabLayout) v.findViewById(R.id.tabss);
        tabLayout.setupWithViewPager(viewPager);
        return v;
    }

    private void setupViewPagerr(ViewPager viewPager) {
        ViewPagerAdapterr adapter = new ViewPagerAdapterr(getFragmentManager());
        adapter.addFragment(new MunicipalityEventFragment(), "Eventos");
        adapter.addFragment(new MunicipalityNoticeFragment(), "Noticias");
        viewPager.setAdapter(adapter);
    }
    class ViewPagerAdapterr extends FragmentPagerAdapter {
        private final List<Fragment> mFragmentList = new ArrayList<>();
        private final List<String> mFragmentTitleList = new ArrayList<>();

        public ViewPagerAdapterr(FragmentManager manager) {
            super(manager);
        }

        @Override
        public Fragment getItem(int position) {
            return mFragmentList.get(position);
        }

        @Override
        public int getCount() {
            return mFragmentList.size();
        }

        public void addFragment(Fragment fragment, String title) {
            mFragmentList.add(fragment);
            mFragmentTitleList.add(title);

        }

        @Override
        public CharSequence getPageTitle(int position) {
            return mFragmentTitleList.get(position);
        }
    }


}