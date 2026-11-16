.class Lcom/melodix/music/PreviewPlayerTiles$6;
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
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 161
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$list:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$retry:Landroid/widget/Button;

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

    .line 161
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$6;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 11

    .line 162
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$500(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_0

    goto :goto_3

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1000(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, ""

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "status"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 163
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

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$802(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$list:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_2

    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$dialog:Landroid/app/Dialog;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$list:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$retry:Landroid/widget/Button;

    iget-wide v8, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$serial:J

    const/4 v10, 0x0

    invoke-static/range {v3 .. v10}, Lcom/melodix/music/PreviewPlayerTiles;->access$1100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    .line 164
    :goto_2
    return-void

    .line 162
    :cond_4
    :goto_3
    return-void
.end method
