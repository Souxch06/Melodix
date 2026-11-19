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

.field final synthetic val$commandId:J

.field final synthetic val$sentId:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 90
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$commandId:J

    iput-wide p4, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

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

    .line 90
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .line 91
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$000(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$commandId:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$1900(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$102(Lcom/melodix/music/PreviewPlayerVolume;Z)Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1100(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 92
    const-string v0, "journal"

    const-string v2, " ; \u00e9tapes "

    const-string v3, ""

    if-eqz p1, :cond_2

    const-string v4, "sent"

    invoke-virtual {p1, v4, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 93
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "commande envoy\u00e9e par la m\u00e9thode "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "method"

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerVolume;->access$1600(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$2000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$302(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3

    .line 92
    :cond_2
    :goto_0
    if-nez p1, :cond_3

    const-string v4, "web"

    goto :goto_1

    :cond_3
    const-string v4, "reason"

    const-string v5, "command"

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerVolume;->access$1400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u00e9chec : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-nez p1, :cond_4

    goto :goto_2

    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$2000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$302(Ljava/lang/String;)Ljava/lang/String;

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$900(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v5

    cmp-long p1, v2, v5

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$1202(Lcom/melodix/music/PreviewPlayerVolume;I)I

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1, v4}, Lcom/melodix/music/PreviewPlayerVolume;->access$1302(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$1800(Lcom/melodix/music/PreviewPlayerVolume;)V

    :cond_5
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Volume lecteur indisponible"

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 94
    :goto_3
    return-void

    .line 91
    :cond_6
    :goto_4
    return-void
.end method
