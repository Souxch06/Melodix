.class Lcom/melodix/music/PreviewPlayerTiles$14$1;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles$14;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$action:Ljava/lang/String;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$i:I

.field private final synthetic val$kind:Ljava/lang/String;

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$n:I

.field private final synthetic val$retry:Landroid/widget/Button;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles$14;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 282
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$dialog:Landroid/app/Dialog;

    iput p5, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$i:I

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$a:Landroid/app/Activity;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$list:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$retry:Landroid/widget/Button;

    iput p9, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$n:I

    iput-object p10, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$action:Ljava/lang/String;

    iput-object p11, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$kind:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$14$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 11

    .prologue
    const/4 v4, 0x0

    .line 283
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$27(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$dialog:Landroid/app/Dialog;

    if-eq v0, v1, :cond_1

    .line 288
    :cond_0
    :goto_0
    return-void

    .line 283
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$15(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 284
    if-nez v6, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$retry:Landroid/widget/Button;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$serial:J

    iget v8, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$n:I

    add-int/lit8 v8, v8, 0x1

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$action:Ljava/lang/String;

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$kind:Ljava/lang/String;

    invoke-static/range {v0 .. v10}, Lcom/melodix/music/PreviewPlayerTiles;->access$34(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 285
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$36(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "id"

    const-string v2, ""

    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$32(Lcom/melodix/music/PreviewPlayerTiles;Z)V

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$29()[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$i:I

    add-int/lit8 v1, v1, -0x1

    const-string v2, "lecture=non-confirmee:travail-remplace"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$30(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0

    .line 286
    :cond_3
    const-string v0, "status"

    const-string v1, ""

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "done"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$retry:Landroid/widget/Button;

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$serial:J

    iget v8, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$n:I

    add-int/lit8 v8, v8, 0x1

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$action:Ljava/lang/String;

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$kind:Ljava/lang/String;

    invoke-static/range {v0 .. v10}, Lcom/melodix/music/PreviewPlayerTiles;->access$34(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;JILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 287
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$32(Lcom/melodix/music/PreviewPlayerTiles;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->this$1:Lcom/melodix/music/PreviewPlayerTiles$14;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles$14;->access$0(Lcom/melodix/music/PreviewPlayerTiles$14;)Lcom/melodix/music/PreviewPlayerTiles;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$retry:Landroid/widget/Button;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$14$1;->val$action:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles;->access$37(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
