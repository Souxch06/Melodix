.class Lcom/melodix/music/PreviewPlayerTiles$18;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V
    .locals 0

    .prologue
    .line 331
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 10

    .prologue
    const-wide/16 v6, 0xa

    const-wide/16 v8, 0x1

    .line 332
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$42(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x64

    div-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ":apres-"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    div-long v4, v0, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    rem-long/2addr v0, v6

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 333
    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$12(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ferme:avant-resultat:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$43(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$13(Ljava/lang/String;)V

    .line 334
    :cond_0
    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$28(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$27(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$29()[Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ferme:avant-resultat:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$44(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    .line 335
    :cond_1
    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$45(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v0

    :goto_0
    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$23(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v6

    .line 336
    :goto_1
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$47(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    add-long/2addr v2, v8

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$48(Lcom/melodix/music/PreviewPlayerTiles;J)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$27(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    add-long/2addr v2, v8

    invoke-static {v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$49(Lcom/melodix/music/PreviewPlayerTiles;J)V

    .line 337
    if-eqz v0, :cond_2

    invoke-static {v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$16(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$a:Landroid/app/Activity;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    :goto_2
    const/4 v7, 0x0

    invoke-static/range {v1 .. v7}, Lcom/melodix/music/PreviewPlayerTiles;->access$38(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;JLjava/lang/String;I)V

    :cond_2
    return-void

    .line 335
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$46(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v0

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$36(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 337
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$27(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    goto :goto_2
.end method
