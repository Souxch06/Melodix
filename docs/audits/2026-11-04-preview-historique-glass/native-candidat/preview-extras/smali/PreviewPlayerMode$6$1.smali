.class Lcom/melodix/music/PreviewPlayerMode$6$1;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode$6;->run()V
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
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerMode$6;

.field private final synthetic val$g:J

.field private final synthetic val$request:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode$6;JLjava/lang/String;)V
    .locals 0

    .prologue
    .line 154
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->val$g:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->val$request:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$6$1;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 155
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v2

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$23(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->val$request:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$24(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 160
    :cond_0
    :goto_0
    return-void

    .line 156
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/melodix/music/PreviewPlayerMode;->access$25(Lcom/melodix/music/PreviewPlayerMode;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$16(Lcom/melodix/music/PreviewPlayerMode;)I

    move-result v2

    .line 157
    if-eqz v1, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerMode;->access$9(Lcom/melodix/music/PreviewPlayerMode;Lorg/json/JSONObject;)V

    if-ltz v2, :cond_2

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$26()[Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$27()[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v2

    aput-object v3, v0, v2

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$17()[Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v0, "sent"

    invoke-virtual {v1, v0, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "commande envoy\u00e9e, r\u00e9sultat non confirm\u00e9"

    :goto_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " ; vue "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "close"

    const-string v5, "unconfirmed"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "confirmed|requested|already-closed|unconfirmed|unknown"

    invoke-static {v4, v5}, Lcom/melodix/music/PreviewPlayerMode;->access$29(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    .line 159
    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    if-eqz v1, :cond_3

    const-string v0, "sent"

    invoke-virtual {v1, v0, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$6$1;->this$1:Lcom/melodix/music/PreviewPlayerMode$6;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode$6;->access$0(Lcom/melodix/music/PreviewPlayerMode$6;)Lcom/melodix/music/PreviewPlayerMode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Contr\u00f4le introuvable ou non s\u00fbr dans la page Spotify"

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 157
    :cond_4
    const-string v0, "contr\u00f4le introuvable ou non s\u00fbr"

    goto :goto_1

    .line 158
    :cond_5
    if-ltz v2, :cond_2

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$17()[Ljava/lang/String;

    move-result-object v0

    const-string v3, "vue cach\u00e9e : r\u00e9ponse indisponible"

    aput-object v3, v0, v2

    goto :goto_2
.end method
