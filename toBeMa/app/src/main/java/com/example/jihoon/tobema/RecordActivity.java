package com.example.jihoon.tobema;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class RecordActivity extends AppCompatActivity {
    TextView nameTv;
    TextView pracNameTv;
    TextView timeTv;
    TextView countTv;
    Button resetBut;
    Button mainBut;
    String pracName = "" ,time  = "", count  = "";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_record);

        nameTv = (TextView)findViewById(R.id.nameTv);
        pracNameTv = (TextView)findViewById(R.id.pracNameTv);
        timeTv = (TextView)findViewById(R.id.timeTv);
        countTv = (TextView)findViewById(R.id.countTv);

        resetBut = (Button)findViewById(R.id.resetBut);
        mainBut = (Button)findViewById(R.id.mainBut);

        final SharedPreferences pref = getSharedPreferences("test",0);
        String temp;

        for(int i = 1 ; i<=6 ; i++){
            pracName +=pref.getString("pracName"+i, "");
            temp = pref.getString("pracName"+i, "");
            if(temp != "") {
                pracName += "\n";
            }
            time += pref.getString("time"+i, "");
            temp = pref.getString("time"+i, "");
            if(temp != "") {
                time += "\n";
            }

            count += pref.getString("count"+i, "");
            temp = pref.getString("count"+i, "");
            if(temp != "") {
                count += "\n";
            }
        }

        nameTv.setText(pref.getString("name", null));
        pracNameTv.setText(pracName);
        timeTv.setText(time);
        countTv.setText(count);

        mainBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(RecordActivity.this , MainActivity.class);
                startActivity(intent);
            }
        });


        resetBut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {    //reset 하는 버튼

                SharedPreferences.Editor editor = pref.edit();
                for(int i = 1 ;i <=6; i++) {
                    editor.remove("pracName"+i);
                    editor.remove("time"+i);
                    editor.remove("count"+i);
                 }

                editor.commit();
                pracNameTv.setText(null);
                timeTv.setText(null);
                countTv.setText(null);

            }
        });
    }
}
