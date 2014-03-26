package <%- MainActivityPackage %>;

import android.app.Activity;
import android.os.Bundle;

public class <%- MainActivityName %> extends Activity {

	static {
		System.loadLibrary("JavaScriptCore");
	}

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
	}
}