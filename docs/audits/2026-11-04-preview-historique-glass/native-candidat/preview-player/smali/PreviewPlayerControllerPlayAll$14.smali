.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;
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

.field final synthetic val$who:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 208
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$id:Ljava/lang/String;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$who:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 208
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$id:Ljava/lang/String;

    const-string v2, "artist"

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$who:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->openLink(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
