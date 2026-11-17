.class Lcom/melodix/music/PreviewPlayerTiles$17;
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

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .prologue
    .line 295
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 10

    .prologue
    const-wide/16 v8, 0xa

    const-wide/16 v6, 0x1

    .line 296
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$30(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x64

    div-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ":apres-"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    div-long v4, v0, v8

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    rem-long/2addr v0, v8

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 297
    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$12(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ferme:avant-resultat:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$31(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$13(Ljava/lang/String;)V

    .line 298
    :cond_0
    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$23(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$22(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$24()[Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ferme:avant-resultat:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$32(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    .line 299
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$33(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    add-long/2addr v2, v6

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$34(Lcom/melodix/music/PreviewPlayerTiles;J)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$22(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    add-long/2addr v2, v6

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$35(Lcom/melodix/music/PreviewPlayerTiles;J)V

    return-void
.end method
