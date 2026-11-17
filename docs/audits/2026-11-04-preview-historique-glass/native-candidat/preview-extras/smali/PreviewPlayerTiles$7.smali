.class Lcom/melodix/music/PreviewPlayerTiles$7;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->loadQueue(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$retry:Landroid/widget/Button;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 187
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$a:Landroid/app/Activity;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$list:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$7;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 9

    .prologue
    .line 188
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_1

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$15(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_3

    const-string v0, ""

    .line 189
    :goto_1
    const-string v1, "started"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "busy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v1, "demarre"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$16(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$retry:Landroid/widget/Button;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$serial:J

    const/4 v8, 0x0

    invoke-static/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->access$17(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    goto :goto_0

    .line 188
    :cond_3
    const-string v1, "status"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 189
    :cond_4
    const-string v0, "demarrage:refuse"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$13(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$14(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0
.end method
