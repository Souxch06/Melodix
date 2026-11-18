.class Lcom/melodix/music/PreviewPlayerTiles$9;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
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

.field private final synthetic val$name:Ljava/lang/String;

.field private final synthetic val$retry:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 252
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$i:I

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$list:Landroid/widget/LinearLayout;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$retry:Landroid/widget/Button;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    .prologue
    .line 252
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$dialog:Landroid/app/Dialog;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$list:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$retry:Landroid/widget/Button;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$9;->val$name:Ljava/lang/String;

    invoke-static/range {v0 .. v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$25(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;)V

    return-void
.end method
