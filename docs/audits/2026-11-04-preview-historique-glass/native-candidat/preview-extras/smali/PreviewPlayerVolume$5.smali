.class Lcom/melodix/music/PreviewPlayerVolume$5;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerVolume;->send()V
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

.field final synthetic val$sentId:J


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

    .line 87
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

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

    .line 87
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .line 88
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$000(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$600(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$800(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 89
    const-string v0, "journal"

    const-string v1, " ; \u00e9tapes "

    const/4 v2, 0x0

    const-string v3, ""

    if-eqz p1, :cond_2

    const-string v4, "sent"

    invoke-virtual {p1, v4, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 90
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "r\u00e9gl\u00e9 par la m\u00e9thode "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "method"

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerVolume;->access$1300(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1700(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1602(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3

    .line 89
    :cond_2
    :goto_0
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v5, -0x1

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerVolume;->access$902(Lcom/melodix/music/PreviewPlayerVolume;I)I

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    if-nez p1, :cond_3

    const-string v5, "web"

    goto :goto_1

    :cond_3
    const-string v5, "reason"

    const-string v6, "command"

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerVolume;->access$1100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerVolume;->access$1002(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u00e9chec : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v5}, Lcom/melodix/music/PreviewPlayerVolume;->access$1000(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez p1, :cond_4

    goto :goto_2

    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1700(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1602(Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1500(Lcom/melodix/music/PreviewPlayerVolume;)V

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Volume lecteur indisponible"

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 91
    :goto_3
    return-void

    .line 88
    :cond_5
    :goto_4
    return-void
.end method
