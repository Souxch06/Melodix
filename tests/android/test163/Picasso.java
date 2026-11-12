package com.squareup.picasso;
import android.widget.ImageView;
/** Test-only cancellation spy, never part of Melodix. */
public final class Picasso {
  public static int canceled;
  private static final Picasso INSTANCE=new Picasso();
  public static Picasso get() { return INSTANCE; }
  public void cancelRequest(ImageView target) { if(target!=null) canceled++; }
}
