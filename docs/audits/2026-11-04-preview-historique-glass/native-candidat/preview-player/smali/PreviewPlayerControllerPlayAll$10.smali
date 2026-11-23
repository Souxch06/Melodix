.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->sheet(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$id:Ljava/lang/String;

.field final synthetic val$track:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 197
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$track:Lorg/json/JSONObject;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$id:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 199
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$track:Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->trackUri(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$track:Lorg/json/JSONObject;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerControllerQueue;->addNext(Ljava/lang/String;Lorg/json/JSONObject;)Z

    move-result v0

    const-string v1, "Ajout\u00e9 \u00e0 la file d\'attente"

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 200
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$id:Ljava/lang/String;

    const-string v3, "Ajouter \u00e0 la file d\'attente|Add to queue"

    invoke-static {v0, v2, v3, v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->pageMenu(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
