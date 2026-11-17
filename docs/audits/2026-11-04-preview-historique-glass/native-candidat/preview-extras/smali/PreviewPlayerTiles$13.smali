.class Lcom/melodix/music/PreviewPlayerTiles$13;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
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

.field private final synthetic val$action:Ljava/lang/String;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$i:I

.field private final synthetic val$kind:Ljava/lang/String;

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$retry:Landroid/widget/Button;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 272
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    iput p5, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    iput-object p9, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$action:Ljava/lang/String;

    iput-object p10, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$kind:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$13;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 11

    .prologue
    .line 273
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$27(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_1

    .line 277
    :cond_0
    :goto_0
    return-void

    .line 273
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$15(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_2

    const-string v0, ""

    move-object v1, v0

    .line 274
    :goto_1
    if-nez v2, :cond_3

    const-string v0, ""

    .line 275
    :goto_2
    const-string v2, "started"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$16(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$31(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$32(Lcom/melodix/music/PreviewPlayerTiles;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v1, "demarre"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$33(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$action:Ljava/lang/String;

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$kind:Ljava/lang/String;

    invoke-static/range {v0 .. v10}, Lcom/melodix/music/PreviewPlayerTiles;->access$34(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 273
    :cond_2
    const-string v0, "status"

    const-string v1, ""

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    .line 274
    :cond_3
    const-string v0, "id"

    const-string v3, ""

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 276
    :cond_4
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v0, "busy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "busy"

    :goto_3
    invoke-static {v2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$35(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$29()[Ljava/lang/String;

    move-result-object v2

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    add-int/lit8 v3, v0, -0x1

    const-string v0, "busy"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "demarrage:occupe"

    :goto_4
    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$30(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto/16 :goto_0

    :cond_5
    const-string v0, "blocked"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "close-unverified"

    goto :goto_3

    :cond_6
    const-string v0, ""

    goto :goto_3

    :cond_7
    const-string v0, "blocked"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "demarrage:fermeture-non-confirmee"

    goto :goto_4

    :cond_8
    const-string v0, "demarrage:refuse"

    goto :goto_4
.end method
