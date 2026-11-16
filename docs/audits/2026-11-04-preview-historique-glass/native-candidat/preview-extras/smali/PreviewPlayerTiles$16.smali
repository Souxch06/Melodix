.class Lcom/melodix/music/PreviewPlayerTiles$16;
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

    .line 264
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->val$i:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 5

    .line 265
    iget p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->val$i:I

    const-string v0, "ferme:avant-resultat"

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$700(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$600(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v3

    cmp-long p1, v1, v3

    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$802(Ljava/lang/String;)Ljava/lang/String;

    .line 266
    :cond_0
    iget p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->val$i:I

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1700(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1600(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v3

    cmp-long p1, v1, v3

    if-eqz p1, :cond_1

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$1802(Ljava/lang/String;)Ljava/lang/String;

    .line 267
    :cond_1
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$502(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)Landroid/app/Dialog;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$608(Lcom/melodix/music/PreviewPlayerTiles;)J

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1608(Lcom/melodix/music/PreviewPlayerTiles;)J

    return-void
.end method
