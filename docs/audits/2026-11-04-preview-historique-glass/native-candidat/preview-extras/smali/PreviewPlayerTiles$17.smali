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

.field final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;I)V
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

    .line 275
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 6

    .line 276
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x64

    div-long/2addr v0, v2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ":apres-"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-wide/16 v2, 0xa

    div-long v4, v0, v2

    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v4, "."

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    rem-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "s"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 277
    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    const-string v1, "ferme:avant-resultat:"

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1000(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$1400(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1102(Ljava/lang/String;)Ljava/lang/String;

    .line 278
    :cond_0
    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2100(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$2200()[Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->val$i:I

    add-int/lit8 v2, v2, -0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$2400(Lcom/melodix/music/PreviewPlayerTiles;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v2

    .line 279
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$802(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$908(Lcom/melodix/music/PreviewPlayerTiles;)J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$17;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2008(Lcom/melodix/music/PreviewPlayerTiles;)J

    return-void
.end method
