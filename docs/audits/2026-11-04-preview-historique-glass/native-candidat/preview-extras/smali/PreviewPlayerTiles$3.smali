.class Lcom/melodix/music/PreviewPlayerTiles$3;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field private final synthetic val$body:Landroid/widget/TextView;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 79
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$body:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 79
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$4(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-static {v0, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$5(Lcom/melodix/music/PreviewPlayerTiles;J)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$3;->val$body:Landroid/widget/TextView;

    const-string v1, "Indisponible dans cette version"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
