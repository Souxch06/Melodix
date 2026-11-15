.class Lcom/melodix/music/PreviewPlayerTiles$1;
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


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 25
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 26
    instance-of v1, v0, Landroid/media/AudioManager;

    if-eqz v1, :cond_0

    invoke-virtual {p1, v3}, Landroid/view/View;->performHapticFeedback(I)Z

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v3, v2, v1}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    .line 28
    :goto_0
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$1;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-virtual {v0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Volume indisponible"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
