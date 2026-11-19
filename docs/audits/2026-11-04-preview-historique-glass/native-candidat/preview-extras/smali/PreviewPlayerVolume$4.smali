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
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerVolume;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 70
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->val$id:J

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

    .line 70
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume$4;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 5

    .line 71
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->val$id:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$900(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$000(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerVolume;->isShown()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1002(Lcom/melodix/music/PreviewPlayerVolume;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1100(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 72
    const/4 v0, -0x1

    if-nez p1, :cond_1

    move v2, v0

    goto :goto_0

    :cond_1
    const-string v2, "percent"

    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    :goto_0
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    if-eqz p1, :cond_2

    const-string v4, "ok"

    invoke-virtual {p1, v4, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    if-ltz v2, :cond_2

    const/16 v1, 0x64

    if-gt v2, v1, :cond_2

    move v0, v2

    :cond_2
    invoke-static {v3, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1202(Lcom/melodix/music/PreviewPlayerVolume;I)I

    .line 73
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1200(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v0

    if-gez v0, :cond_4

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const-string v1, "web"

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    const-string v2, "reason"

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1302(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1300(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1502(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_2

    .line 74
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1200(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " % observ\u00e9 via "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "method"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1600(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1502(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1200(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result p1

    if-lez p1, :cond_5

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1200(Lcom/melodix/music/PreviewPlayerVolume;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1702(Lcom/melodix/music/PreviewPlayerVolume;I)I

    .line 75
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$4;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1800(Lcom/melodix/music/PreviewPlayerVolume;)V

    .line 76
    return-void

    .line 71
    :cond_6
    :goto_3
    return-void
.end method
