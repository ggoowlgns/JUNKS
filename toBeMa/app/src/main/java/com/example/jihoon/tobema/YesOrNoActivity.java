package com.example.jihoon.tobema;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;

public class YesOrNoActivity extends AppCompatActivity {
    Button yesBut;
    Button noBut;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_yes_or_no);
        yesBut = (Button)findViewById(R.id.yesBut);
        noBut = (Button)findViewById(R.id.noBut);

        final Intent intent1 = new Intent(this,ActActivity.class);
        yesBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(intent1);
            }
        });

        final Intent intent2 = new Intent(this,RecordActivity.class);
        noBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(intent2);
            }
        });
    }
}
