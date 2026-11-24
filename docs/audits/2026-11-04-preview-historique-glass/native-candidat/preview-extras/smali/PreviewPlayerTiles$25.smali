.class Lcom/melodix/music/PreviewPlayerTiles$25;
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

.field final synthetic val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

.field final synthetic val$i:I

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Lcom/melodix/music/PreviewPlayerSheet;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 466
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$i:I

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$list:Landroid/widget/LinearLayout;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 12

    .line 466
    iget p1, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$i:I

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$i:I

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$a:Landroid/app/Activity;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$dialog:Lcom/melodix/music/PreviewPlayerSheet;

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$list:Landroid/widget/LinearLayout;

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles$25;->val$retry:Landroid/widget/Button;

    const-string v10, "run"

    const-string v11, ""

    invoke-static/range {v4 .. v11}, Lcom/melodix/music/PreviewPlayerTiles;->access$3400(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
