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

    .line 234
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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 234
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$13;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 12

    .line 235
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_0

    goto :goto_3

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1300(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, ""

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "status"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 236
    :goto_0
    const-string p1, "started"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string p1, "busy"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const-string p1, "demarrage:refuse"

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2202(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$2300(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_2

    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v0, "demarre"

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2402(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    iget-wide v7, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$action:Ljava/lang/String;

    iget-object v11, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$kind:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v1 .. v11}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    .line 237
    :goto_2
    return-void

    .line 235
    :cond_4
    :goto_3
    return-void
.end method
