package com.company.product;
import android.os.Bundle;
import android.widget.FrameLayout;

import com.unity3d.player.UnityPlayerActivity;

public abstract class OverrideUnityActivity extends UnityPlayerActivity
{
    public static OverrideUnityActivity instance = null;

    abstract protected void didSceneStartLoad(String message);
    abstract protected void didSceneFinishLoad(String message);
    abstract protected String getSceneIdentifier(String message);
    abstract protected String getScenesAssetBundlePath(String message);
    abstract protected String getResourcesAssetBundlePath(String message);
    abstract protected void sendMessage(String message);

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        instance = this;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        instance = null;
    }
}