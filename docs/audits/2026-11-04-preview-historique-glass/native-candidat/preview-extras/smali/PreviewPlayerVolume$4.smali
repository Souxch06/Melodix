.class Lcom/melodix/music/PreviewPlayerVolume$4;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerVolume;->read()V
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
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerVolume;

.field private final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;J)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume$4;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v1, -0x1

    .line 68
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->val$id:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$6(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$0(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerVolume;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    .line 73
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, v6}, Lcom/melodix/music/PreviewPlayerVolume;->access$7(Lcom/melodix/music/PreviewPlayerVolume;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$8(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 69
    if-nez v2, :cond_3

    move v0, v1

    :goto_1
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    if-eqz v2, :cond_4

    const-string v4, "ok"

    invoke-virtual {v2, v4, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    if-ltz v0, :cond_4

    const/16 v4, 0x64

    if-gt v0, v4, :cond_4

    :goto_2
    invoke-static {v3, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$9(Lcom/melodix/music/PreviewPlayerVolume;I)V

    .line 70
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$10(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v0

    if-gez v0, :cond_6

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    if-nez v2, :cond_5

    const-string v0, "web"

    :goto_3
    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$11(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$12(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$13(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$14(Ljava/lang/String;)V

    .line 72
    :cond_2
    :goto_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$16(Lcom/melodix/music/PreviewPlayerVolume;)V

    goto :goto_0

    .line 69
    :cond_3
    const-string v0, "percent"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_2

    .line 70
    :cond_5
    const-string v0, "reason"

    const-string v3, "web"

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 71
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$10(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " % observ\u00e9"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$14(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$10(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$10(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$15(Lcom/melodix/music/PreviewPlayerVolume;I)V

    goto :goto_4
.end method
