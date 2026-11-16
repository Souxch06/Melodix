package com.melodix.music;

import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

/** Presentation only: adapt the player to the measured panel, not device orientation. */
public final class PreviewPlayerResponsive {
    private PreviewPlayerResponsive() {}
    public static void apply(View panel) {
        if (!(panel instanceof ViewGroup)) return;
        View root=((ViewGroup)panel).findViewWithTag("previewPlayerLandscapeRow");
        View art=((ViewGroup)panel).findViewWithTag("previewPlayerArtFrame");
        View card=((ViewGroup)panel).findViewWithTag("previewPlayerArtCard");
        View details=((ViewGroup)panel).findViewWithTag("previewPlayerLandscapeDetails");
        if (!(root instanceof LinearLayout) || art==null || card==null || details==null ||
            art.getParent()!=root || details.getParent()!=root || card.getParent()!=art) return;
        if (!(art.getLayoutParams() instanceof LinearLayout.LayoutParams) ||
            !(details.getLayoutParams() instanceof LinearLayout.LayoutParams)) return;
        int width=panel.getWidth()-panel.getPaddingLeft()-panel.getPaddingRight();
        if (width<=0) return;
        float density=panel.getResources().getDisplayMetrics().density;
        int dp600=(int)(600*density+0.5f), dp318=(int)(318*density+0.5f), dp18=(int)(18*density+0.5f);
        // A two-column player needs room for a 76dp play button, four 48dp
        // targets, four labelled tiles and the cover without squeezing text.
        boolean narrow=width<dp600;
        LinearLayout row=(LinearLayout)root;
        int wanted=narrow?LinearLayout.VERTICAL:LinearLayout.HORIZONTAL;
        if(row.getOrientation()!=wanted)row.setOrientation(wanted);
        LinearLayout.LayoutParams ap=(LinearLayout.LayoutParams)art.getLayoutParams();
        int aw=narrow?ViewGroup.LayoutParams.MATCH_PARENT:0, ah=narrow?Math.min(dp318,width):ViewGroup.LayoutParams.WRAP_CONTENT;
        float weight=narrow?0f:0.44f;int right=narrow?0:dp18;
        if(ap.width!=aw || ap.height!=ah || ap.weight!=weight || ap.rightMargin!=right){
            ap.width=aw;ap.height=ah;ap.weight=weight;ap.rightMargin=right;art.setLayoutParams(ap);
        }
        LinearLayout.LayoutParams dp=(LinearLayout.LayoutParams)details.getLayoutParams();
        int dw=narrow?ViewGroup.LayoutParams.MATCH_PARENT:0;float detailWeight=narrow?0f:0.56f;
        if(dp.width!=dw || dp.weight!=detailWeight){dp.width=dw;dp.weight=detailWeight;details.setLayoutParams(dp);}
        ViewGroup.LayoutParams cp=card.getLayoutParams();
        int side=narrow?Math.min(dp318,width):0;
        if(cp.width!=side || cp.height!=side){cp.width=side;cp.height=side;card.setLayoutParams(cp);}
    }
}
