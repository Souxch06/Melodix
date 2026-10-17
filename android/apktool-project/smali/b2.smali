.class public final synthetic Lb2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Landroid/webkit/CookieManager;

.field public final synthetic b:Landroid/webkit/WebView;

.field public final synthetic c:Lzg0;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/CookieManager;Landroid/webkit/WebView;Lzg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb2;->a:Landroid/webkit/CookieManager;

    .line 5
    .line 6
    iput-object p2, p0, Lb2;->b:Landroid/webkit/WebView;

    .line 7
    .line 8
    iput-object p3, p0, Lb2;->c:Lzg0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p1, p0, Lb2;->a:Landroid/webkit/CookieManager;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/webkit/CookieManager;->flush()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Lc2;

    .line 9
    .line 10
    iget-object v0, p0, Lb2;->b:Landroid/webkit/WebView;

    .line 11
    .line 12
    iget-object p0, p0, Lb2;->c:Lzg0;

    .line 13
    .line 14
    invoke-direct {p1, v0, p0}, Lc2;-><init>(Landroid/webkit/WebView;Lzg0;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "(function(){ try { localStorage.clear(); sessionStorage.clear(); } catch(e){} })();"

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
