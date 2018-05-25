package com.example.jihoon.tobema;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class PersonalActivity extends Activity {


    EditText nameEt;
    EditText heightEt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_personal);

        nameEt = (EditText)findViewById(R.id.nameEt);
        heightEt = (EditText)findViewById(R.id.heightEt);



        final Intent intent1 = new Intent(this,MainActivity.class);

        Button exitButton = (Button)findViewById(R.id.exitBut);
        exitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(intent1);
            }
        });
    }
    protected void onStop(){
        super.onStop();

        SharedPreferences mPreferences;
        mPreferences = getSharedPreferences("test", 0);
        SharedPreferences.Editor editor = mPreferences.edit();

        String height = heightEt.getText().toString();
        String name = nameEt.getText().toString();
        editor.putString("height", height );
        editor.putString("name", name);
        editor.commit();
    }
}
