.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->pageMenu(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$ok:Ljava/lang/String;

.field final synthetic val$w:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 303
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;->val$w:Landroid/webkit/WebView;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;->val$ok:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 303
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 3

    .line 304
    const-string v0, "\"started\""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;->val$a:Landroid/app/Activity;

    const-string v1, "\"absent\""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "Titre introuvable dans la page Spotify, r\u00e9essaie"

    goto :goto_0

    :cond_0
    const-string p1, "Action indisponible"

    :goto_0
    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 305
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;->val$w:Landroid/webkit/WebView;

    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$21$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$21;)V

    const-wide/16 v1, 0x2bc

    invoke-virtual {p1, v0, v1, v2}, Landroid/webkit/WebView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 307
    return-void
.end method
