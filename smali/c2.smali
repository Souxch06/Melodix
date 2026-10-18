.class public final synthetic Lc2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/webkit/WebView;

.field public final synthetic c:Lb90;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/WebView;Le2;Lwb0;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    iput p2, p0, Lc2;->a:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lc2;->b:Landroid/webkit/WebView;

    .line 8
    .line 9
    iput-object p3, p0, Lc2;->c:Lb90;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Landroid/webkit/WebView;Lzg0;)V
    .locals 1

    .line 12
    const/4 v0, 0x0

    iput v0, p0, Lc2;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc2;->b:Landroid/webkit/WebView;

    iput-object p2, p0, Lc2;->c:Lb90;

    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lc2;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lc2;->c:Lb90;

    .line 4
    .line 5
    iget-object p0, p0, Lc2;->b:Landroid/webkit/WebView;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    check-cast v1, Lwb0;

    .line 11
    .line 12
    check-cast p1, Ljava/lang/String;

    .line 13
    .line 14
    const-string p1, "https://open.spotify.com/"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v1, p0}, Lwb0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_0
    check-cast v1, Lzg0;

    .line 26
    .line 27
    check-cast p1, Ljava/lang/String;

    .line 28
    .line 29
    const-string p1, "https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&method=password&allow_password=1&allow_signup=1"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Lzg0;->a()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
