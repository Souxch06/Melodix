.class public final Lcom/melodix/music/SpotifyWebPageActivity;
.super Landroid/app/Activity;

# Separate, user-initiated WebView: no bridge, injected scripts, DOM capture,
# page-data export, token handling, or mutation of the native library gate.
.field private web:Landroid/webkit/WebView;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V
    return-void
.end method

.method protected final onCreate(Landroid/os/Bundle;)V
    .locals 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
    new-instance v0, Landroid/widget/LinearLayout;
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V
    const/high16 v2, -0x1000000
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V
    new-instance v2, Landroid/widget/TextView;
    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    const-string v3, "Spotify (page Web)"
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v2, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    const/4 v3, -0x1
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V
    const/high16 v3, 0x41900000    # 18sp
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V
    const/16 v3, 0x11
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V
    const/16 v3, 0x10
    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    new-instance v2, Landroid/webkit/WebView;
    invoke-direct {v2, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V
    iput-object v2, p0, Lcom/melodix/music/SpotifyWebPageActivity;->web:Landroid/webkit/WebView;
    const/4 v3, 0x0
    invoke-virtual {v2, v3}, Landroid/view/View;->setSaveEnabled(Z)V
    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;
    move-result-object v4
    invoke-virtual {v4, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
    invoke-virtual {v4, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V
    invoke-virtual {v4, v3}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V
    invoke-virtual {v4, v1}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V
    const/4 v5, 0x2    # LOAD_NO_CACHE: do not use cached page content as a fallback
    invoke-virtual {v4, v5}, Landroid/webkit/WebSettings;->setCacheMode(I)V
    new-instance v4, Lcom/melodix/music/SpotifyWebPageClient;
    invoke-direct {v4}, Lcom/melodix/music/SpotifyWebPageClient;-><init>()V
    invoke-virtual {v2, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -0x1
    const/high16 v1, 0x3f800000
    invoke-direct {v4, v5, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V
    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    new-instance v1, Landroid/widget/Button;
    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V
    const-string v3, "Retour à Melodix"
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v3, 0x0
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setAllCaps(Z)V
    new-instance v3, Lcom/melodix/music/SpotifyWebPageClose;
    invoke-direct {v3, p0}, Lcom/melodix/music/SpotifyWebPageClose;-><init>(Landroid/app/Activity;)V
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V
    const-string v0, "https://open.spotify.com/"
    invoke-virtual {v2, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    return-void
.end method

.method protected final onDestroy()V
    .locals 1
    iget-object v0, p0, Lcom/melodix/music/SpotifyWebPageActivity;->web:Landroid/webkit/WebView;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V
    :done
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V
    return-void
.end method
