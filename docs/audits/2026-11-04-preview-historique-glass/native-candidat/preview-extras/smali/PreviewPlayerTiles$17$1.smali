.class Lcom/melodix/music/PreviewPlayerTiles$17$1;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles$17;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerTiles$17;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles$17;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 327
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

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

    .line 327
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$17$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 11

    .line 328
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-wide v2, v2, Lcom/melodix/music/PreviewPlayerTiles$17;->val$serial:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 329
    if-nez v7, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v0, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget v1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v2, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v3, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$dialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v4, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$list:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v5, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$retry:Landroid/widget/Button;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-wide v6, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$serial:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget p1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$n:I

    add-int/lit8 v8, p1, 0x1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v9, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$action:Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v10, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$kind:Ljava/lang/String;

    invoke-static/range {v0 .. v10}, Lcom/melodix/music/PreviewPlayerTiles;->access$3600(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 330
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$3300(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "id"

    const-string v1, ""

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3402(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$3000()[Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget v0, v0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    add-int/lit8 v0, v0, -0x1

    const-string v1, "lecture=non-confirmee:travail-remplace"

    aput-object v1, p1, v0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget v0, v0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$17;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v3, v3, Lcom/melodix/music/PreviewPlayerTiles$17;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$3200(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 331
    :cond_2
    const-string p1, "status"

    invoke-virtual {v7, p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "done"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v0, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget v1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v2, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v3, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$dialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v4, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$list:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v5, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$retry:Landroid/widget/Button;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-wide v6, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$serial:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget p1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$n:I

    add-int/lit8 v8, p1, 0x1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v9, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$action:Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v10, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$kind:Ljava/lang/String;

    invoke-static/range {v0 .. v10}, Lcom/melodix/music/PreviewPlayerTiles;->access$3600(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 332
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3402(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v1, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget v2, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v3, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v4, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$dialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v5, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$list:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v6, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$retry:Landroid/widget/Button;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$17;

    iget-object v8, p1, Lcom/melodix/music/PreviewPlayerTiles$17;->val$action:Ljava/lang/String;

    invoke-static/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->access$3800(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 333
    return-void

    .line 328
    :cond_4
    :goto_0
    return-void
.end method
