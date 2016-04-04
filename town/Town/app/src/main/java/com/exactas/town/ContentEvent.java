package com.exactas.town;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.view.View;

/**
 * Created by diego on 08/03/16.
 */
public class ContentEvent extends Activity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_event);
        View smallImageView = findViewById(R.id.imagenPost);
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            smallImageView.setTransitionName(getString(R.string.change_image_transform));

        }
    }
}


