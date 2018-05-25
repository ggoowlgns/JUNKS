package com.example.jihoon.tobema;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class CheckSet_SitUpActivity extends AppCompatActivity {

    EditText CountEt;
    EditText SetEt;
    Button But1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check_set_sit_up);

        CountEt = (EditText)findViewById(R.id.CountEt);
        SetEt = (EditText)findViewById(R.id.SetEt);
        But1 = (Button)findViewById(R.id.But1);

        final Intent intent1 = new Intent(this,SitupActivity.class);

        But1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                intent1.putExtra("count",CountEt.getText().toString());
                intent1.putExtra("set",SetEt.getText().toString());
                startActivity(intent1);
            }
        });

    }

    protected void onStop(){
        super.onStop();
        /*
        SharedPreferences mPreferences;
        mPreferences = getSharedPreferences("test", 0);
        SharedPreferences.Editor editor = mPreferences.edit();
        String countSt = CountEt.getText().toString();
        String setSt = SetEt.getText().toString();

        editor.putString("count",countSt);
        editor.putString("set", setSt);
        editor.commit();
        */
    }

}
