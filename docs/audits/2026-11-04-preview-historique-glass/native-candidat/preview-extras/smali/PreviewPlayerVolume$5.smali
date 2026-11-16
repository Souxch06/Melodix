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
    .line 58
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
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 58
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$8(Lcom/melodix/music/PreviewPlayerVolume;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$0(Lcom/melodix/music/PreviewPlayerVolume;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->val$sentId:J

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$6(Lcom/melodix/music/PreviewPlayerVolume;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    if-eqz v0, :cond_0

    const-string v1, "sent"

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerVolume;->access$9(Lcom/melodix/music/PreviewPlayerVolume;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerVolume;->access$12(Lcom/melodix/music/PreviewPlayerVolume;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$5;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerVolume;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Volume lecteur indisponible"

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method
