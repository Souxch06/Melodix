.class Lcom/melodix/music/PreviewPlayerTiles$10;
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

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 181
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$dialog:Landroid/app/Dialog;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$list:Landroid/widget/LinearLayout;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 181
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$dialog:Landroid/app/Dialog;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$10;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1400(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method
