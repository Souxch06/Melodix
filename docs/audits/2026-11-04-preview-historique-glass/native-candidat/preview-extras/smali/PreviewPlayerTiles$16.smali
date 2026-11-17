.class Lcom/melodix/music/PreviewPlayerTiles$16;
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

.field private final synthetic val$dialog:Lcom/melodix/music/PreviewPlayerSheet;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Lcom/melodix/music/PreviewPlayerSheet;)V
    .locals 0

    .prologue
    .line 323
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$16;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerSheet;->dismiss()V

    return-void
.end method
