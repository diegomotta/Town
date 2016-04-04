package com.exactas.town;


import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.widget.Toast;

import com.android.volley.toolbox.Volley;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import clases.MySingleton;
import fragments.ContentFragment;
import fragments.MunicipalityEventFragment;
import fragments.MunicipalityNoticeFragment;
import fragments.SupermarketEventFragment;
import fragments.SupermarketNoticeFragment;



public class MainActivity extends AppCompatActivity {

    //Defining Variables
    private Toolbar toolbar;
    private NavigationView navigationView;
    private DrawerLayout drawerLayout;
    private TabLayout tabLayout;
    private ViewPager viewPager;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Initializing Toolbar and setting it as the actionbar
        viewPager = (ViewPager) super.findViewById(R.id.viewpager);

        tabLayout=(TabLayout) super.findViewById(R.id.tabs);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        final MainActivity act = this;
      //  viewPager =(ViewPager) findViewById(R.id.viewpager);
        //  setupViewPager(viewPager);
        tabLayout=(TabLayout) findViewById(R.id.tabs);
        //tabLayout.setupWithViewPager(viewPager);
        navigationView = (NavigationView) findViewById(R.id.nav_view);
        //Setting Navigation View Item Selected Listener to handle the item click of the navigation menu
        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            // This method will trigger on item Click of navigation menu
            @Override
            public boolean onNavigationItemSelected(MenuItem menuItem) {
                //Checking if the item is in checked state or not, if not make it in checked state
                if(menuItem.isChecked()) menuItem.setChecked(false);
                else menuItem.setChecked(true);

                //Closing drawer on item click
                drawerLayout.closeDrawers();

                //Check to see which item was being clicked and perform appropriate action
                switch (menuItem.getItemId()){
                    case R.id.municipality:
//                        Toast.makeText(getApplicationContext(), "Municipalidad", Toast.LENGTH_SHORT).show();
//                        ContentFragment fragment = new ContentFragment();
//                        android.support.v4.app.FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
//                        fragmentTransaction.replace(R.id.frame, fragment);
//                        fragmentTransaction.commit();
                        removeTab();
                        setTitle("Municipalidad");
                        Setup(R.id.municipality,act );
                        return true;
                    case R.id.supermarket:
                        removeTab();
                        setTitle("Supermercado");
                        Setup(R.id.supermarket,act);
                        //Toast.makeText(getApplicationContext(), "Supermercado", Toast.LENGTH_SHORT).show();
                        return true;
                    case R.id.nav_share:
                        Toast.makeText(getApplicationContext(), "nav share", Toast.LENGTH_SHORT).show();
                        return true;
                    case R.id.nav_send:
                        Toast.makeText(getApplicationContext(), "nav send", Toast.LENGTH_SHORT).show();
                        return true;
                    default:
                        Toast.makeText(getApplicationContext(), "Somethings Wrong", Toast.LENGTH_SHORT).show();
                        return true;

                }
            }



        });

        // Initializing Drawer Layout and ActionBarToggle
        drawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle actionBarDrawerToggle = new ActionBarDrawerToggle(this,drawerLayout,toolbar,R.string.openDrawer, R.string.closeDrawer){

            @Override
            public void onDrawerClosed(View drawerView) {
                // Code here will be triggered once the drawer closes as we dont want anything to happen so we leave this blank
                super.onDrawerClosed(drawerView);
            }

            @Override
            public void onDrawerOpened(View drawerView) {
                // Code here will be triggered once the drawer open as we dont want anything to happen so we leave this blank
                super.onDrawerOpened(drawerView);
            }
        };
        //Setting the actionbarToggle to drawer layout
        drawerLayout.addDrawerListener(actionBarDrawerToggle);
        //calling sync state is necessay or else your hamburger icon wont show up
        actionBarDrawerToggle.syncState();

    }

    private void Setup(int id, MainActivity activity){
        ViewPagerAdapter adapter = new ViewPagerAdapter(getSupportFragmentManager());
        if (R.id.municipality == id) {
            if(adapter.getmFragmentTitleList().size() > 0) {
                adapter.getmFragmentTitleList().clear();
            }
            adapter.addFragment(new MunicipalityEventFragment(), "Eventos");
            adapter.addFragment(new MunicipalityNoticeFragment(), "Noticias");
            adapter.notifyDataSetChanged();
   //    adapter.notifyDataSetChanged();
        } else {
                if (adapter.getmFragmentTitleList().size()> 0) {
                     adapter.getmFragmentTitleList().clear();
                }
                adapter.addFragment(new SupermarketEventFragment(), "Eventoss");
                adapter.addFragment(new SupermarketNoticeFragment(), "Noticiass");
                adapter.notifyDataSetChanged();
        }
        viewPager.setAdapter(adapter);
        tabLayout.setupWithViewPager(viewPager);
    }

    public void removeTab() {
       // System.out.println( tabLayout.getTabCount());
        for(int i=1 ; i < tabLayout.getTabCount();i++){
            tabLayout.removeTabAt(i);
           // mPagerAdapter.removeTabPage(position);
        }
    }
    class ViewPagerAdapter extends FragmentStatePagerAdapter {
        private  List<Fragment> mFragmentList = new ArrayList<>();
        private  List<String> mFragmentTitleList = new ArrayList<>();

        public List<String> getmFragmentTitleList() {
            return mFragmentTitleList;
        }

        public List<Fragment> getmFragmentList() {
            return mFragmentList;
        }

        public ViewPagerAdapter(FragmentManager manager) {
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

        //this is called when notifyDataSetChanged() is called
        @Override
        public int getItemPosition(Object object) {
            // refresh all fragments when data set changed
            return   POSITION_NONE;
        }


        @Override
        public void destroyItem(ViewGroup container, int position, Object object) {
             if (position >= getCount()) {
                FragmentManager manager = ((Fragment) object).getFragmentManager();
                FragmentTransaction trans = manager.beginTransaction();
                 trans.remove((Fragment) object);
                 trans.commit();

            }

        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
