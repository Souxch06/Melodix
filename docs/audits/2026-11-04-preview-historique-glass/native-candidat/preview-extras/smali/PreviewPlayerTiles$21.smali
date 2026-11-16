.class Lcom/melodix/music/PreviewPlayerTiles$21;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$n:I


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

    .line 308
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$n:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 308
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$21;->val$n:I

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$3100(Lcom/melodix/music/PreviewPlayerTiles;I)V

    return-void
.end method
