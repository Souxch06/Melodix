.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 324
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;

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

    .line 324
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 6

    .line 325
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 326
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Lorg/json/JSONTokener;

    invoke-direct {v3, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    instance-of v3, p1, Ljava/lang/String;

    if-eqz v3, :cond_0

    new-instance v3, Lorg/json/JSONArray;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v3, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object v3, v1

    .line 327
    :goto_0
    move p1, v2

    :goto_1
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge p1, v4, :cond_4

    const-string v4, ""

    invoke-virtual {v3, p1, v4}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "(?i)^(rechercher|search).*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_2

    .line 329
    :cond_1
    const-string v5, "(?i)^(cr\u00e9er|create|nouvelle playlist|new playlist).*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v0, v2, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2

    :cond_2
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 327
    :cond_3
    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 329
    :catch_0
    move-exception p1

    :cond_4
    nop

    .line 330
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->val$a:Landroid/app/Activity;

    const-string v0, "Liste des playlists introuvable dans le menu Spotify"

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->val$w:Landroid/webkit/WebView;

    const-string v0, "document.dispatchEvent(new KeyboardEvent(\'keydown\',{key:\'Escape\',bubbles:true}))"

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void

    .line 331
    :cond_5
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;->this$1:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1;->this$0:Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24;->val$a:Landroid/app/Activity;

    invoke-direct {p1, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Ajouter \u00e0 une playlist"

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    new-instance v2, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;

    invoke-direct {v2, p0, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$2;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$1;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$24$1$1;)V

    .line 335
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 336
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 337
    return-void
.end method
