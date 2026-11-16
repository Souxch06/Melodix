.class Lcom/melodix/music/PreviewPlayerTiles$12;
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

    .line 228
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    iput p5, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$i:I

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$list:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$retry:Landroid/widget/Button;

    iput-object p9, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$action:Ljava/lang/String;

    iput-object p10, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$kind:Ljava/lang/String;

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

    .line 228
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$12;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 17

    .line 229
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$serial:J

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_4

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$500(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v1

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    if-eq v1, v2, :cond_0

    goto :goto_3

    :cond_0
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    move-object/from16 v2, p1

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1000(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, ""

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "status"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 230
    :goto_0
    const-string v1, "started"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "busy"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const-string v1, "demarrage:refuse"

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1802(Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v2, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$i:I

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$retry:Landroid/widget/Button;

    invoke-static {v1, v2, v3, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->access$1900(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_2

    :cond_3
    :goto_1
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v7, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$i:I

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iget-object v9, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$list:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$retry:Landroid/widget/Button;

    iget-wide v12, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$serial:J

    iget-object v15, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$action:Ljava/lang/String;

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$kind:Ljava/lang/String;

    const/4 v14, 0x0

    move-object/from16 v16, v1

    invoke-static/range {v6 .. v16}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    .line 231
    :goto_2
    return-void

    .line 229
    :cond_4
    :goto_3
    return-void
.end method
