.class Lcom/melodix/music/PreviewPlayerTiles$5;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field private final synthetic val$g:J

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->val$g:J

    iput p4, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 118
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->val$g:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$5(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$13(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$14(Lcom/melodix/music/PreviewPlayerTiles;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$5(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$15(Lcom/melodix/music/PreviewPlayerTiles;J)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$9(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->val$i:I

    const-string v2, "unknown"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$11(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->val$i:I

    const-string v2, "command"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$5;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v1, "Ouverture non confirm\u00e9e. R\u00e9essayer"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$16(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
