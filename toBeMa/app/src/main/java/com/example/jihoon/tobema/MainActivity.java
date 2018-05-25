package com.example.jihoon.tobema;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //actBut 입력
        Button actButton = (Button)findViewById(R.id.actBut);
        Button perButton = (Button)findViewById(R.id.perBut);
        Button recordBut= (Button)findViewById(R.id.recordBut);

        final Intent intent1 = new Intent(this,ActActivity.class);
        actButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent1);
            }
        });

        final Intent intent2 = new Intent(this,PersonalActivity.class);
        perButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent2);
            }
        });

        final Intent intent3 = new Intent(this,RecordActivity.class);
        recordBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent3);
            }
        });

    }
}
