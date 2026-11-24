.class Lcom/melodix/music/PreviewPlayerTiles$12;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->lyricsTick(Landroid/app/Activity;Landroid/app/Dialog;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$dur:Landroid/widget/TextView;

.field final synthetic val$fill:Landroid/view/View;

.field final synthetic val$play:Landroid/widget/TextView;

.field final synthetic val$pos:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 320
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$fill:Landroid/view/View;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$pos:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dur:Landroid/widget/TextView;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$play:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 320
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$fill:Landroid/view/View;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$pos:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dur:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$play:Landroid/widget/TextView;

    invoke-static/range {v0 .. v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$3200(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method
