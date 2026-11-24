.class Lcom/melodix/music/PreviewPlayerTiles$10;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->fillTick(Landroid/app/Dialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$dialog:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V
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

    .line 289
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 289
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$dialog:Landroid/app/Dialog;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2500(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    return-void
.end method
