.class Lcom/melodix/music/PreviewPlayerTiles$24;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$dialog:Lcom/melodix/music/PreviewPlayerSheet;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Lcom/melodix/music/PreviewPlayerSheet;)V
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

    .line 470
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$24;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$24;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 470
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$24;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerSheet;->dismiss()V

    return-void
.end method
