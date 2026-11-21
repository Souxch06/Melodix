.class public final synthetic Lz1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Le2;

.field public final synthetic b:Landroid/webkit/CookieManager;

.field public final synthetic c:Landroid/webkit/WebView;

.field public final synthetic d:Lwb0;


# direct methods
.method public synthetic constructor <init>(Le2;Landroid/webkit/CookieManager;Landroid/webkit/WebView;Lwb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1;->a:Le2;

    .line 5
    .line 6
    iput-object p2, p0, Lz1;->b:Landroid/webkit/CookieManager;

    .line 7
    .line 8
    iput-object p3, p0, Lz1;->c:Landroid/webkit/WebView;

    .line 9
    .line 10
    iput-object p4, p0, Lz1;->d:Lwb0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
# Session restore is disabled: nothing is written back into the WebView.
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method
