.class Lcom/melodix/music/PreviewPlayerTiles$8;
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

    .line 241
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

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

    .line 241
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$8;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 9

    .line 242
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1200(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_8

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1300(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto/16 :goto_5

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

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

    .line 243
    :goto_0
    if-nez p1, :cond_2

    move-object p1, v0

    goto :goto_1

    :cond_2
    const-string v2, "id"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 244
    :goto_1
    const-string v2, "started"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1700(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1802(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1902(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v0, "demarre"

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2002(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$serial:J

    const/4 v8, 0x0

    invoke-static/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->access$2100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    goto :goto_4

    .line 245
    :cond_3
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v2, "busy"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "blocked"

    if-eqz v3, :cond_4

    move-object v0, v2

    goto :goto_2

    :cond_4
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v0, "close-unverified"

    :cond_5
    :goto_2
    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2202(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "demarrage:occupe"

    goto :goto_3

    :cond_6
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p1, "demarrage:fermeture-non-confirmee"

    goto :goto_3

    :cond_7
    const-string p1, "demarrage:refuse"

    :goto_3
    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1402(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$list:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1500(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    .line 246
    :goto_4
    return-void

    .line 242
    :cond_8
    :goto_5
    return-void
.end method
