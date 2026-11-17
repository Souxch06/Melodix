.class Lcom/melodix/music/PreviewPlayerTiles$18;
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

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$dialog:Landroid/app/Dialog;

.field private final synthetic val$i:I

.field private final synthetic val$list:Landroid/widget/LinearLayout;

.field private final synthetic val$retry:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 301
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$list:Landroid/widget/LinearLayout;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .prologue
    .line 301
    iget v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$a:Landroid/app/Activity;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$dialog:Landroid/app/Dialog;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$36(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$18;->val$retry:Landroid/widget/Button;

    const-string v6, "run"

    const-string v7, ""

    invoke-static/range {v0 .. v7}, Lcom/melodix/music/PreviewPlayerTiles;->access$21(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
