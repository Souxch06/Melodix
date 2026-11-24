.class Lcom/melodix/music/PreviewPlayerTiles$21;
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
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$action:Ljava/lang/String;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$i:I

.field final synthetic val$kind:Ljava/lang/String;

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 421
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$dialog:Landroid/app/Dialog;

    iput p5, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$i:I

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$a:Landroid/app/Activity;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$list:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$retry:Landroid/widget/Button;

    iput-object p9, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$action:Ljava/lang/String;

    iput-object p10, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$kind:Ljava/lang/String;

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

    .line 421
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$21;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 12

    .line 422
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$3700(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_9

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3800(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$serial:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto/16 :goto_5

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, ""

    if-nez p1, :cond_1

    move-object v1, v0

    goto :goto_0

    :cond_1
    const-string v1, "status"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 423
    :goto_0
    if-nez p1, :cond_2

    move-object p1, v0

    goto :goto_1

    :cond_2
    const-string v2, "id"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 424
    :goto_1
    const-string v2, "started"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1700(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$4202(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$4302(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v0, "demarre"

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$4402(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$i:I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$a:Landroid/app/Activity;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$dialog:Landroid/app/Dialog;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$list:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$retry:Landroid/widget/Button;

    iget-wide v7, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$serial:J

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$action:Ljava/lang/String;

    iget-object v11, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$kind:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v1 .. v11}, Lcom/melodix/music/PreviewPlayerTiles;->access$4500(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 425
    :cond_3
    const-string p1, "blocked"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$action:Ljava/lang/String;

    const-string v4, "transfer"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$4600(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$i:I

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$a:Landroid/app/Activity;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$dialog:Landroid/app/Dialog;

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$list:Landroid/widget/LinearLayout;

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$retry:Landroid/widget/Button;

    invoke-static/range {v4 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->access$4700(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_4

    .line 426
    :cond_4
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$4602(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v4, "busy"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    move-object v0, v4

    goto :goto_2

    :cond_5
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v0, "close-unverified"

    :cond_6
    :goto_2
    invoke-static {v2, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$4802(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$3900()[Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$i:I

    sub-int/2addr v2, v3

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string p1, "demarrage:occupe"

    goto :goto_3

    :cond_7
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    const-string p1, "demarrage:fermeture-non-confirmee"

    goto :goto_3

    :cond_8
    const-string p1, "demarrage:refuse"

    :goto_3
    aput-object p1, v0, v2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$i:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$4100(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 427
    :goto_4
    return-void

    .line 422
    :cond_9
    :goto_5
    return-void
.end method
