package com.example.jihoon.tobema;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class ActActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_act);

        ImageButton pushUpBut = (ImageButton)findViewById(R.id.pushUpBut);
        ImageButton narowBut = (ImageButton)findViewById(R.id.narowBut);
        ImageButton wideBut = (ImageButton)findViewById(R.id.wideBut);
        ImageButton situpBut = (ImageButton)findViewById(R.id.situpBut);
        ImageButton legRaiseBut = (ImageButton)findViewById(R.id.legRaiseBut);
        ImageButton pullUpBut = (ImageButton)findViewById(R.id.pullUpBUt);

        final Intent intent1= new Intent(this,CheckSetActivity.class);
        pushUpBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent1);
            }
        });


        final Intent intent2 = new Intent(this,PushUp_Narow.class);
        narowBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent2);
            }
        });


        final Intent intent3 = new Intent(this,PushUp_Wide.class);
        wideBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent3);
            }
        });

        final Intent intent4 = new Intent(this,CheckSet_SitUpActivity.class);
        situpBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent4);
            }
        });

        final Intent intent5 = new Intent(this,CheckSet_LegRaiseActivity.class);
        legRaiseBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent5);
            }
        });

        final Intent intent6 = new Intent(this,PullUpActivity.class);
        pullUpBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent6);
            }
        });

    }
}
