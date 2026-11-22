.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;
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
.method constructor <init>(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 200
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;->val$track:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;->val$id:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 202
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;->val$a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Supprimer de cette playlist ?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;->val$track:Lorg/json/JSONObject;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->title(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 203
    const-string v1, "Annuler"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12$1;

    invoke-direct {v1, p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$12$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$12;)V

    .line 204
    const-string v2, "Supprimer"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 205
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 206
    return-void
.end method
