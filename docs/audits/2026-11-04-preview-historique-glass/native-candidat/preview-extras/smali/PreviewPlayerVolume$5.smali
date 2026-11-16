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
        "Landroid/webkit/ValueCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerVolume;

.field private final synthetic val$sentId:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;J)V
    .locals 0

    .prologue
    .line 84
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerVolume$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 85
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$0(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$6(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$8(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 86
    if-eqz v0, :cond_2

    const-string v1, "sent"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_4

    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v2, -0x1

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerVolume;->access$9(Lcom/melodix/music/PreviewPlayerVolume;I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    if-nez v0, :cond_3

    const-string v0, "web"

    :goto_1
    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$11(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$12(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u00e9chec : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$13(Lcom/melodix/music/PreviewPlayerVolume;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$17(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$16(Lcom/melodix/music/PreviewPlayerVolume;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Volume lecteur indisponible"

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    const-string v2, "reason"

    const-string v3, "command"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 87
    :cond_4
    const-string v0, "\u00e9v\u00e9nements envoy\u00e9s (effet sonore inconnu)"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$17(Ljava/lang/String;)V

    goto :goto_0
.end method
