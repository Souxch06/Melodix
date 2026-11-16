.class Lcom/melodix/music/PreviewPlayerTiles$2;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
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

.field final synthetic val$body:Landroid/widget/TextView;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 72
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$body:Landroid/widget/TextView;

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

    .line 72
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$2;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 5

    .line 74
    const-string v0, "Indisponible dans cette version"

    iget-wide v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$serial:J

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$300(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$400(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v1

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$dialog:Landroid/app/Dialog;

    if-eq v1, v2, :cond_0

    goto :goto_2

    .line 75
    :cond_0
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$308(Lcom/melodix/music/PreviewPlayerTiles;)J

    .line 77
    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p1

    .line 78
    instance-of v1, p1, Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$body:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 79
    :cond_1
    new-instance v1, Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 80
    const-string p1, "ok"

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, ""

    if-eqz p1, :cond_2

    :try_start_1
    const-string p1, "body"

    invoke-virtual {v1, p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 81
    :cond_2
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$body:Landroid/widget/TextView;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    move-object v1, v0

    goto :goto_0

    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v4, 0x1f40

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 82
    goto :goto_1

    :catch_0
    move-exception p1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$body:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    :goto_1
    return-void

    .line 74
    :cond_4
    :goto_2
    return-void
.end method
