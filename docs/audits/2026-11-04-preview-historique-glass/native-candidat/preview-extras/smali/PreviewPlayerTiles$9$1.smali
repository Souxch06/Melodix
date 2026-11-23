.class Lcom/melodix/music/PreviewPlayerTiles$9$1;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles$9;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerTiles$9;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles$9;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 233
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

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

    .line 233
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$9$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 8

    .line 234
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-wide v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1300(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-wide v2, v2, Lcom/melodix/music/PreviewPlayerTiles$9;->val$serial:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 235
    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v1, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v2, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$dialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v3, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$list:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v4, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$retry:Landroid/widget/Button;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-wide v5, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$serial:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget p1, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$n:I

    add-int/lit8 v7, p1, 0x1

    invoke-static/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles;->access$2100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    return-void

    .line 236
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1800(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "id"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1902(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    const-string p1, "lecture=non-confirmee:travail-remplace"

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1402(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$list:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$9;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1500(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void

    .line 237
    :cond_2
    const-string v0, "status"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "done"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v1, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$a:Landroid/app/Activity;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v2, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$dialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v3, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$list:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v4, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$retry:Landroid/widget/Button;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-wide v5, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$serial:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget p1, p1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$n:I

    add-int/lit8 v7, p1, 0x1

    invoke-static/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles;->access$2100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    return-void

    .line 238
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1902(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerTiles$9;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$9;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$9$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$9;

    iget-object v3, v3, Lcom/melodix/music/PreviewPlayerTiles$9;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2400(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    .line 239
    return-void

    .line 234
    :cond_4
    :goto_0
    return-void
.end method
