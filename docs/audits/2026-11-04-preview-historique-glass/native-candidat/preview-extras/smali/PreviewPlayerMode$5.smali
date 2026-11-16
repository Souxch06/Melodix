.class Lcom/melodix/music/PreviewPlayerMode$5;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;->tryHiddenView()V
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
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;

.field private final synthetic val$g:J

.field private final synthetic val$request:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;JLjava/lang/String;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$g:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$request:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerMode$5;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 145
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerMode;->access$5(Lcom/melodix/music/PreviewPlayerMode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$23(Lcom/melodix/music/PreviewPlayerMode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->val$request:Ljava/lang/String;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerMode;->access$24(Lcom/melodix/music/PreviewPlayerMode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 151
    :cond_0
    :goto_0
    return-void

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerMode;->access$8(Lcom/melodix/music/PreviewPlayerMode;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 147
    if-eqz v0, :cond_2

    const-string v1, "started"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0, v4}, Lcom/melodix/music/PreviewPlayerMode;->access$25(Lcom/melodix/music/PreviewPlayerMode;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$16(Lcom/melodix/music/PreviewPlayerMode;)I

    move-result v0

    if-ltz v0, :cond_3

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$17()[Ljava/lang/String;

    move-result-object v1

    const-string v2, "contr\u00f4le introuvable : vue non ouverte"

    aput-object v2, v1, v0

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$26()[Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerMode;->access$27()[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v0

    aput-object v2, v1, v0

    .line 149
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerMode;->access$1(Lcom/melodix/music/PreviewPlayerMode;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerMode$5;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerMode;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Contr\u00f4le introuvable dans la page Spotify"

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
