.class public final Ll9;
.super Landroid/webkit/WebView;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static final a(Ll9;ILjava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "true"

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onWindowVisibilityChanged(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onWindowVisibilityChanged(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final onWindowVisibilityChanged(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    :cond_0
    new-instance v0, Lk9;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Lk9;-><init>(Ll9;I)V

    .line 17
    .line 18
    .line 19
    const-string p1, "typeof playing!==\'undefined\'&&playing;"

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onWindowVisibilityChanged(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
