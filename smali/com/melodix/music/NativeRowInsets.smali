.class public final Lcom/melodix/music/NativeRowInsets;
.super Ljava/lang/Object;

# MEL-BUG-014. Rows built by renderNativeRows were added with addView(View) and no
# LayoutParams, so they inherited MATCH_PARENT x WRAP_CONTENT with zero margins
# and ran edge to edge, while the home renderer poses its own insets. Measured:
# settings row final_w = 800dp on tablet and 411.4dp on phone, margins 0/0, parent
# padding 0/0. The container cannot simply be padded: it is shared with the home
# renderer, which already insets its children, so that would double the gutter.
# Applying the gutter at the add site fixes every row from this path at once.
.method public static apply(Landroid/content/Context;Landroid/view/View;)V
    .locals 3

    :try_start_insets
    if-eqz p0, :insets_done
    if-eqz p1, :insets_done

    const-string v0, "mel_gutter"
    const/16 v1, 0x10
    invoke-static {p0, v0, v1}, Lcom/melodix/music/NativeUiRowFactory;->metric(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, -0x1
    const/4 p0, -0x2
    invoke-direct {v1, v2, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_insets
    .catch Ljava/lang/Throwable; {:try_start_insets .. :try_end_insets} :insets_catch
    goto :insets_done
    :insets_catch
    move-exception v0
    :insets_done
    return-void
.end method
