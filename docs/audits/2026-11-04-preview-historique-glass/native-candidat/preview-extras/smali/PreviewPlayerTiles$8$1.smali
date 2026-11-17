.class Lcom/melodix/music/PreviewPlayerTiles$8$1;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles$8;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$n:I

.field private final synthetic val$retry:Landroid/widget/Button;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles$8;JLandroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V
    .locals 0

    .prologue
    .line 197
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$a:Landroid/app/Activity;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$list:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$retry:Landroid/widget/Button;

    iput p8, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$8$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 9

    .prologue
    .line 198
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles$8;->access$0(Lcom/melodix/music/PreviewPlayerTiles$8;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$8;->access$0(Lcom/melodix/music/PreviewPlayerTiles$8;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_1

    .line 201
    :cond_0
    :goto_0
    return-void

    .line 198
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$8;->access$0(Lcom/melodix/music/PreviewPlayerTiles$8;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$15(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 199
    if-eqz v0, :cond_2

    const-string v1, "status"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "done"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$8;->access$0(Lcom/melodix/music/PreviewPlayerTiles$8;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$retry:Landroid/widget/Button;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$serial:J

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$n:I

    add-int/lit8 v8, v0, 0x1

    invoke-static/range {v1 .. v8}, Lcom/melodix/music/PreviewPlayerTiles;->access$17(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JI)V

    goto :goto_0

    .line 200
    :cond_3
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles$8;->access$0(Lcom/melodix/music/PreviewPlayerTiles$8;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$8$1;->val$retry:Landroid/widget/Button;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$19(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;)V

    goto :goto_0
.end method
